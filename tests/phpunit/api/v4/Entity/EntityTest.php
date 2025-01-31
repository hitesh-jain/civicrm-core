<?php

/*
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC. All rights reserved.                        |
 |                                                                    |
 | This work is published under the GNU AGPLv3 license with some      |
 | permitted exceptions and without any warranty. For full license    |
 | and copyright information, see https://civicrm.org/licensing       |
 +--------------------------------------------------------------------+
 */

/**
 *
 * @package CRM
 * @copyright CiviCRM LLC https://civicrm.org/licensing
 */


namespace api\v4\Entity;

use Civi\Api4\Entity;
use api\v4\Api4TestBase;

/**
 * @group headless
 */
class EntityTest extends Api4TestBase {

  public function testEntityGet() {
    $result = Entity::get(FALSE)
      ->execute()
      ->indexBy('name');
    $this->assertArrayHasKey('Entity', $result,
      "Entity::get missing itself");

    $this->assertEquals('CRM_Contact_DAO_Contact', $result['Contact']['dao']);
    $this->assertEquals(['DAOEntity'], $result['Contact']['type']);
    $this->assertEquals(['id'], $result['Contact']['primary_key']);
    // Contact icon fields
    $this->assertEquals(['contact_sub_type:icon', 'contact_type:icon'], $result['Contact']['icon_field']);
  }

  public function testEntity() {
    $result = Entity::getActions(FALSE)
      ->execute()
      ->indexBy('name');
    $this->assertNotContains(
      'create',
      array_keys((array) $result),
      "Entity entity has more than basic actions");
  }

  public function testEntityComponent() {
    \CRM_Core_BAO_ConfigSetting::disableComponent('CiviEvent');
    $result = Entity::get(FALSE)
      ->execute()
      ->indexBy('name');
    $this->assertArrayNotHasKey('Participant', $result,
      "Entity::get should not have Participant when CiviEvent disabled");

    \CRM_Core_BAO_ConfigSetting::enableComponent('CiviEvent');
    $result = Entity::get(FALSE)
      ->execute()
      ->indexBy('name');
    $this->assertArrayHasKey('Participant', $result,
      "Entity::get should have Participant when CiviEvent enabled");
  }

}

struct SuperDeep1 { x: Int }
struct SuperDeep2 { g: SuperDeep1 }
struct SuperDeep3 { g: SuperDeep2 }
struct SuperDeep4 { g: SuperDeep3 }
struct SuperDeep5 { g: SuperDeep4 }
struct SuperDeep6 { g: SuperDeep5 }
struct SuperDeep7 { g: SuperDeep6 }
struct SuperDeep8 { g: SuperDeep7 }

contract SuperDeepContract {
  field: SuperDeep8;

  init() {
    self.field = SuperDeep8{ g: SuperDeep7{ g: SuperDeep6{ g: SuperDeep5{ g: SuperDeep4{ g: SuperDeep3{ g: SuperDeep2{ g: SuperDeep1{ x:99 } } } } } } } };
  }
}
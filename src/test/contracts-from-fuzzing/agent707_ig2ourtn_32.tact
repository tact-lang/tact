struct SDeep1 { x:Int }
struct SDeep2 { a:SDeep1 }
struct SDeep3 { a:SDeep2 }
struct SDeep4 { a:SDeep3 }
struct SDeep5 { a:SDeep4 }
struct SDeep6 { a:SDeep5 }
struct SDeep7 { a:SDeep6 }
struct SDeep8 { a:SDeep7 }

contract Chain8Struct {
  s:SDeep8;
  init() {
    self.s = SDeep8{ a:SDeep7{ a:SDeep6{ a:SDeep5{ a:SDeep4{ a:SDeep3{ a:SDeep2{ a:SDeep1{ x:1 }}}}}}}};
  }
}
struct SDeep1 { a: Int }
struct SDeep2 { b: SDeep1 }
struct SDeep3 { c: SDeep2 }
struct SDeep4 { d: SDeep3 }
struct SDeep5 { e: SDeep4 }
struct SDeep6 { f: SDeep5 }

contract SixLevelDeep {
    var: SDeep6;

    init() {
        self.var = SDeep6{f:SDeep5{e:SDeep4{d:SDeep3{c:SDeep2{b:SDeep1{a:42}}}}}};
    }
}
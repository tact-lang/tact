struct Deep1 { a:Int }
struct Deep2 { d: Deep1 }
struct Deep3 { d: Deep2 }
struct Deep4 { d: Deep3 }
struct Deep5 { d: Deep4 }

contract FiveDeep {
    val: Deep5;
    init() {
        self.val = Deep5{ d: Deep4{ d: Deep3{ d: Deep2{ d: Deep1{ a:123 } } } } };
    }
}
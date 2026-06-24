struct Deep1 { a: Int }
struct Deep2 { a: Deep1 }
struct Deep3 { a: Deep2 }
struct Deep4 { a: Deep3 }
struct Deep5 { a: Deep4 }
struct Deep6 { a: Deep5 }
struct Deep7 { a: Deep6 }
struct Deep8 { a: Deep7 }

contract DeepNest {
    d: Deep8;
    init() {
        self.d = Deep8{ a: Deep7{ a: Deep6{ a: Deep5{ a: Deep4{ a: Deep3{ a: Deep2{ a: Deep1{ a: 3 }}}}}}}};
    }
}
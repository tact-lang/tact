struct Deep1 { val: Int }
struct Deep2 { val: Deep1 }
struct Deep3 { val: Deep2 }
struct Deep4 { val: Deep3 }

contract TestContract {
    d: Deep4;
    init() {
        self.d = Deep4{ val: Deep3{ val: Deep2{ val: Deep1{ val: 42 }}}};
    }
}
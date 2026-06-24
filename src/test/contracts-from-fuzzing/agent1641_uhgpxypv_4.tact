struct Deep1 { f: Int; }
struct Deep2 { g: Deep1; }
struct Deep3 { h: Deep2; }
struct Deep4 { i: Deep3; }

contract TestContract {
    val: Deep4;

    init() {
        self.val = Deep4{ i: Deep3{ h: Deep2{ g: Deep1{ f: 42 }}} };
    }
}
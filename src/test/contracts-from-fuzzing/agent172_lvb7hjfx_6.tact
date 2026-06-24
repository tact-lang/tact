struct Deep1 { x: Int }
struct Deep2 { d1: Deep1 }
struct Deep3 { d2: Deep2 }
struct Deep4 { d3: Deep3 }

contract Test {
    item: Deep4;

    init() {
        self.item = Deep4{ d3: Deep3{ d2: Deep2{ d1: Deep1{ x: 7 } } } };
    }
}
struct Deep1 { val: Int }
struct Deep2 { nested: Deep1 }
struct Deep3 { nested: Deep2 }
struct Deep4 { nested: Deep3 }

contract Depth4 {
    data: Deep4;

    init() {
        self.data = Deep4{ nested: Deep3{ nested: Deep2{ nested: Deep1{val: 100} } } };
    }
}

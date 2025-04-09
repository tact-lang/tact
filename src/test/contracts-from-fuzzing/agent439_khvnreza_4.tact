struct Deep3 { i: Int }

struct Deep2 { d3: Deep3; b: Bool }

struct Deep1 { d2: Deep2; s: String }

contract Test4 {
    field: Deep1;

    init() {
        self.field = Deep1{
            d2: Deep2{ d3: Deep3{i: 42}, b: false },
            s: "deep",
        };
    }

    receive() {}
}
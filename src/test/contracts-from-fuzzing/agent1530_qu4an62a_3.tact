struct Deep1 { val1: Int; }
struct Deep2 { d1: Deep1; }
struct Deep3 { d2: Deep2; }
struct Deep4 { d3: Deep3; }

contract DeepNested {
    field: Deep4;

    init() {
        self.field = Deep4{d3: Deep3{d2: Deep2{d1: Deep1{val1: 123}}}};
    }
}
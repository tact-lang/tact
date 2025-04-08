struct Deep1 { val: Int; }
struct Deep2 { field: Deep1; }
struct Deep3 { field: Deep2; }
struct Deep4 { field: Deep3; }
contract DeeplyNested {
    nest: Deep4;
    init() {
        self.nest = Deep4{field: Deep3{field: Deep2{field: Deep1{val: 42}}}};
    }
}
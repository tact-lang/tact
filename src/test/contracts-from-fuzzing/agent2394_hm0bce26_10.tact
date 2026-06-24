struct NestedMany1 { a: Int; b: String; c: Bool; d: Address; opt: Int?; }
struct NestedMany2 { e: Bool; f: String; g: Address; h: Int?; i: NestedMany1; }

contract ComplexCombo {
    data: NestedMany2;

    init() {
        self.data = NestedMany2{
            e: false,
            f: "sample",
            g: myAddress(),
            h: null,
            i: NestedMany1{
                a: 10,
                b: "xyz",
                c: true,
                d: myAddress(),
                opt: null
            }
        };
    }
}

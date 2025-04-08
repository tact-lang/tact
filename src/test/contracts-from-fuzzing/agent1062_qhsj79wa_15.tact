struct DeepNested {
    a: Int = 1;
    b: Bool = false;
    c: String = "c";
}

struct MoreNested {
    first: DeepNested;
    second: DeepNested;
    third: DeepNested;
}

contract ManyDeep {
    stuff: MoreNested = MoreNested{
        first: DeepNested{ a: 10, b: true, c: "x" },
        second: DeepNested{ a: 20, b: false, c: "y" },
        third: DeepNested{ a: 30, b: true, c: "z" }
    };
    
    init() {
        self.stuff = MoreNested{
            first: DeepNested{ a: 100, b: false, c: "xx" },
            second: DeepNested{ a: 200, b: true, c: "yy" },
            third: DeepNested{ a: 300, b: false, c: "zz" }
        };
    }
}
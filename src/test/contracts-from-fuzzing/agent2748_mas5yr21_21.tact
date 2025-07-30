struct NestedMixed {
    a: Int;
    b: Bool; 
    strOpt: String?;
}

struct Composite {
    one: NestedMixed;
    two: NestedMixed;
    value: Int;
}

contract MultiComposite {
    big: Composite;

    init() {
        self.big = Composite{
            one: NestedMixed{ a:1, b:true, strOpt:null },
            two: NestedMixed{ a:2, b:false, strOpt:"hi" },
            value: 100
        };
    }
}
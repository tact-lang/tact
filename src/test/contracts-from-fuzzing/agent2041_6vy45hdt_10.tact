struct NestedMulti {
    a: Int;
    b: Bool;
    c: String?;
}

struct Middle {
    x: NestedMulti;
    y: NestedMulti;
}

contract ComplexNested {
    data: Middle;
    init() {
        self.data = Middle{
            x: NestedMulti{ a:1, b:true, c:null },
            y: NestedMulti{ a:2, b:false, c:"str" },
        };
    }
}
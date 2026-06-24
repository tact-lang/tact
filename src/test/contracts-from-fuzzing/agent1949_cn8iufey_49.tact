struct NestedStr {
    a: Int;
    b: Bool;
}

contract TestDefaultNested {
    n: NestedStr = NestedStr{ a:1, b:true };

    init() {
        self.n = NestedStr{ a:5, b:false};
    }
}

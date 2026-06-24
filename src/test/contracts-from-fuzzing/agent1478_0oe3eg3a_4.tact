struct BoolNested {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract BoolNestedContract {
    flagz: BoolNested;

    init() {
        self.flagz = BoolNested{ a:true, b:false, c:true, d:false };
    }
}

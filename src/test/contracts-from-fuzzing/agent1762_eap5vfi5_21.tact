struct InnerStr {
    foo: Int;
    bar: Bool;
}

contract TwoStructs {
    one: InnerStr;
    two: InnerStr;
    init() {
        self.one = InnerStr{ foo:1, bar:true };
        self.two = InnerStr{ foo:2, bar:false };
    }
}
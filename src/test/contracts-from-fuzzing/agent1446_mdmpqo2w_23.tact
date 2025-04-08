struct UStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    foo: UStruct;
    bar: UStruct;

    init() {
        self.foo = UStruct{ a:1, b:true, c:"A" };
        self.bar = UStruct{ a:2, b:false, c:"B" };
    }
}

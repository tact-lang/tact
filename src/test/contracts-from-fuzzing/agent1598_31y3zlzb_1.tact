struct Inner {
    a: Int;
    b: Bool?;
}

contract Test1 {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Inner;
    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = "ok";
        self.field4 = Inner{a: 5, b: null};
    }
}
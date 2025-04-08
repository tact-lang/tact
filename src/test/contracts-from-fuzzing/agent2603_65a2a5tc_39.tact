struct HasNested {
    i: Int;
    b: Bool;
}

contract TupleAndNested {
    i: Int;
    s: String;
    nested: HasNested;

    init() {
        self.i = 5;
        self.s = "test";
        self.nested = HasNested{i:42,b:true};
    }
}

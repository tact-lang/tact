struct Inner {
    a: Int;
    b: Bool;
}

contract MultiFieldContract {
    field1: Inner;
    field2: Int;
    field3: Bool = false;
    field4: String;
    field5: Slice;

    init() {
        self.field1 = Inner{a:42,b:true};
        self.field2 = 100;
        self.field4 = "hello";
        self.field5 = emptyCell().asSlice();
    }
}
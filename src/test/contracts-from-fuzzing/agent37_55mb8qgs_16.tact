struct S {
    s: String;
}

contract StringsInStorage {
    field1: S;
    field2: String;

    init() {
        self.field1 = S{ s: "hello" };
        self.field2 = "world";
    }
}

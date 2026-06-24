struct NoOptionals {
    a: Int;
    b: Bool;
    c: String;
}

contract PlainStruct {
    data: NoOptionals;
    init() {
        self.data = NoOptionals{a: 11, b: true, c: "hi"};
    }
}
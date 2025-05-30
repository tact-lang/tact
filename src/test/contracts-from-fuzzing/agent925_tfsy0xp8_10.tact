struct MessageStruct {
    foo: Int;
    bar: String;
}

contract StructArrayFields {
    m1: MessageStruct;
    m2: MessageStruct;

    init() {
        self.m1 = MessageStruct{ foo: 1, bar: "one" };
        self.m2 = MessageStruct{ foo: 2, bar: "two" };
    }
}
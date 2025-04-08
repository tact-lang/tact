struct S {
    i: Int as int8;
    b: Bool;
}

contract SerializedStruct {
    data: S;
    init() {
        self.data = S{ i: 120, b: true };
    }
}

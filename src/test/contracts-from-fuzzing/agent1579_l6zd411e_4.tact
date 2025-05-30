struct BigStruct {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    s1: String;
    s2: String;
}

contract LargeFields {
    payload: BigStruct;

    init() {
        self.payload = BigStruct{
            i1: 1, i2: 2, i3: 3, i4: 4,
            b1: true, b2: false, b3: true,
            s1: "hello", s2: "world"
        };
    }

    receive() {
        self.payload.i1 = self.payload.i1 + 1;
    }
}
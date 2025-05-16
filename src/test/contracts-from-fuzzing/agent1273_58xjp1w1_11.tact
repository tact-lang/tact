struct S1 {
    v1: Int as uint8;
    v2: Int as uint64;
    txt: String;
}

contract SerializedNestedTypes {
    s: S1;

    init() {
        self.s = S1{v1: 255, v2: 42, txt: "hello"};
    }
}
struct S {
    a: Int as uint8;
    b: Int;
    c: String;
    d: Bool;
}

contract WithSerializedStruct {
    s: S;

    init() {
        self.s = S{
            a:255, b:-1, c:"abc", d:true
        };
    }
}
struct InnerStruct {
    x: Int;
}

contract DefaultFieldOrderTest {
    a: Int;
    b: InnerStruct;
    c: Int;
    d: Bool;

    init() {
        self.a = 1;
        self.b = InnerStruct{ x: 2 };
        self.c = 3;
        self.d = true;
    }
}
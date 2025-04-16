struct DeepInner {
    x: Int? = null;
}

struct BasicStruct {
    di: DeepInner? = null;
    y: Bool = false;
}

message(777) Msg {
    s: BasicStruct? = null;
}

contract TestMix {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: BasicStruct = BasicStruct{};
    e: Msg = Msg{};

    init() {
        self.a = 42;
        self.b = false;
        self.c = 123;
        self.d = BasicStruct{
            di: DeepInner{ x: -7 },
            y: true
        };
        self.e = Msg{
            s: BasicStruct{
                di: DeepInner{ x: -99 },
                y: false
            }
        };
    }
}
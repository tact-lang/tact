struct OptStruct {
    a: Int?;
    b: Inner?;
}

struct Inner {
    c: Int;
    d: String?;
}

contract OptStructContract {
    opt: OptStruct;

    init() {
        self.opt = OptStruct{
            a: null,
            b: Inner{
                c: 42,
                d: null
            }
        };
    }
}

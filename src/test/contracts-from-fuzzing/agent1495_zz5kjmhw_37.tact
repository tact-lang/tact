struct Wrapped {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    text: String;
    n: Int;
}

contract TestWrap {
    w: Wrapped;

    init() {
        self.w = Wrapped{
            inner: InnerStruct{flag: true, text: "msg", n: 7}
        };
    }
}

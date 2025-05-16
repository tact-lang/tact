struct InnerD {
    m: Int = 123;
    s: String = "hi";
}

struct MidD {
    inner: InnerD?;
    flag: Bool;
}

contract DefaultPropagation {
    store: MidD;

    init() {
        self.store = MidD{
            inner: null,
            flag: true
        };
    }
}
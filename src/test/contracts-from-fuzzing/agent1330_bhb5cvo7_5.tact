struct OptionDeep {
    x: Int?;
    y: Bool?;
    inner: Inner?;
}

struct Inner {
    f1: Int;
    f2: String;
}

contract OptDeep {
    data: OptionDeep;

    init() {
        self.data = OptionDeep{
            x: null,
            y: true,
            inner: Inner{ f1: 7, f2: "ok" }
        };
    }
}
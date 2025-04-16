struct ComboNested {
    inner: ComboInner;
    optionalInner: ComboInner?;
}

struct ComboInner {
    x: Int;
    y: Bool?;
    s: String;
}

contract ComboContract {
    data: ComboNested;

    init() {
        self.data = ComboNested{
            inner: ComboInner{
                x: 5,
                y: null,
                s: "hello",
            },
            optionalInner: null,
        };
    }
}

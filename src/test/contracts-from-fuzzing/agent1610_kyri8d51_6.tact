struct OptInner {
    a: Int?;
    b: Bool?;
    c: Address?;
}

struct OptOuter {
    inner: OptInner?;
    label: String;
}

contract OptionalComplex {
    data: OptOuter;
    init() {
        self.data = OptOuter{
            inner: OptInner{
                a: null,
                b: true,
                c: null,
            },
            label: "nested opts",
        };
    }
}
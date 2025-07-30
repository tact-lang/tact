struct OptionalInner {
    flag: Bool?;
}

struct OptionalOuter {
    inner: OptionalInner?;
    value: Int?;
}

contract DeepOptionals {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{ inner:null, value:null };
    }
}
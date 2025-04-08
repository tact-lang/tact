struct OptionalInner { x: Int?; y: Bool? }

struct OptionalOuter {
    inner: OptionalInner?;
    str: String?;
    n: Int?;
}

contract Test6 {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{
            inner: null,
            str: null,
            n: null,
        };
    }

    receive() {}
}
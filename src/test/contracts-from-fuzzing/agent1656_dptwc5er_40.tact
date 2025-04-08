struct SInner {
    x: Int;
}

struct SOuter {
    f: SInner?;
    z: Bool;
}

contract SOptionalStructTest {
    data: SOuter;

    init() {
        self.data = SOuter{
            f: null,
            z: true,
        };
    }
}

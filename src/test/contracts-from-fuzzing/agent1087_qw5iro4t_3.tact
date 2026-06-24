struct DeepInner {
    flag: Bool;
    number: Int;
}

struct MidLevel {
    inner: DeepInner;
    another: Bool;
}

struct Outer {
    mid: MidLevel;
    extra: Int;
    addr: Address;
}

contract TestContract {
    info: Outer;

    init() {
        self.info = Outer{
            mid: MidLevel{
                inner: DeepInner{
                    flag: false,
                    number: -999,
                },
                another: true,
            },
            extra: 123456,
            addr: myAddress(),
        };
    }

    receive() {}
}
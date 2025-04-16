struct Inner {
    flag: Bool;
    count: Int as uint8;
}

struct Outer {
    optInner: Inner?;
    label: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            optInner: Inner{
                flag: true,
                count: 255,
            },
            label: "test"
        };
    }
}
struct OptionalInner {
    val: Int?;
    flag: Bool?;
}

struct Outer {
    data: OptionalInner?;
    count: Int;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer {
            data: null,
            count: 100
        };
    }
}
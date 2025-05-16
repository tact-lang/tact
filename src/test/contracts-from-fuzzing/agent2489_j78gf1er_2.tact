struct OptionalNested {
    optInner: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested {
            optInner: Inner{
                val: 123,
                flag: true
            }
        };
    }
}

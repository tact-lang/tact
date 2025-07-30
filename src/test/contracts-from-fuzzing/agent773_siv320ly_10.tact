struct OptionalOuter {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
}

contract OptionalWithNested {
    val: OptionalOuter;

    init() {
        self.val = OptionalOuter{
            inner: Inner{
                flag: false,
            },
        };
    }
}
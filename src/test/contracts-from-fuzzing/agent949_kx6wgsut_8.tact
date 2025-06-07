struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    deep: Deeper?;
}

struct Deeper {
    flag: Bool;
}

contract OptionalNestTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: Inner{
                deep: Deeper{
                    flag: true
                }
            }
        };
    }
}

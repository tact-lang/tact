struct OptionalNested {
    inner: OptInside?;
}

struct OptInside {
    x: Int;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: OptInside{x:1}
        };
    }
}

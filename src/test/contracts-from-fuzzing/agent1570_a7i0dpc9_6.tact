struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    deep: Deeper?;
}

struct Deeper {
    val: Int?;
}

contract TestContract {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{ inner: null };
    }
}
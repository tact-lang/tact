struct Container {
    optionalInner: Inner?;
    val: Int;
}

struct Inner {
    flag: Bool;
    note: String;
}

contract OptionalNested {
    data: Container;

    init() {
        self.data = Container{
            optionalInner: null,
            val: 5
        };
    }
}
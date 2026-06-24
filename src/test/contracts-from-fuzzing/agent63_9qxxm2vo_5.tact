struct MyInner {
    flag: Bool;
}

struct MyOuter {
    inner: MyInner?;
    number: Int;
}

contract OptionalNested {
    data: MyOuter;

    init() {
        self.data = MyOuter{
            inner: null,
            number: 123
        };
    }
}
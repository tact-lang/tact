struct SInner {
    foo: Int;
}

contract OptionalOfStruct {
    data: SInner?;

    init() {
        self.data = SInner{
            foo: 42,
        };
    }
}
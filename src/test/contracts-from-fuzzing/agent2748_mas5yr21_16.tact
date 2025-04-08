struct OverlapStruct {
    foo: Int;
    Foo: Int;
}

contract OverlapWithStruct {
    s: OverlapStruct;

    init() {
        self.s = OverlapStruct{
            foo: 10,
            Foo: 20
        };
    }
}
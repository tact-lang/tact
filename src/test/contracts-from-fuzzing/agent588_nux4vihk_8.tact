struct InnerNoDefault {
    foo: Int;
    flag: Bool;
}

contract NoDefaultStruct {
    data: InnerNoDefault;

    init() {
        self.data = InnerNoDefault{
            foo: 10,
            flag: true
        };
    }

    receive() {
        let _ = self.data.foo;
    }
}
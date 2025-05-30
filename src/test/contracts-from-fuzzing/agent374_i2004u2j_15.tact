struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract TestContract {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{foo: null, bar: null, baz: null};
    }

    receive() {
        if (self.os.foo != null) {
            let _ = self.os.foo!!;
        }
    }
}
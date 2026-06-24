struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }

    receive() {
        self.data = OptionalStruct{ foo: 10, bar: true };
        self.data;
    }
}
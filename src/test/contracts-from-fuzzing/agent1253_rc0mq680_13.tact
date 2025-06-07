struct OptionalStruct {
    foo: Int;
}

contract OptStructTest {
    var1: OptionalStruct?;

    init() {
        self.var1 = null;
    }
}

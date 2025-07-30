struct OptStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalStructTest {
    maybeData: OptStruct?;
    
    init() {
        self.maybeData = null;
    }
}
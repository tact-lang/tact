struct InnerOptioned {
    x: Int = 10;
    y: Bool = false;
}

contract OptionalNestedTest {
    optStruct: InnerOptioned? = null;
    init() {
        self.optStruct = InnerOptioned{x: 777, y: true};
    }
}
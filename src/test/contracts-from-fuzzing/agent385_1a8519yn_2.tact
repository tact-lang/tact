struct Inner {
    val: Int;
}

contract OptionalStructFieldTest {
    optData: Inner?; 

    init() {
        self.optData = null;
    }
}

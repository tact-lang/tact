struct OptionalNested {
    level1: Int;
    level2: Int?;
    level3: Int?;
}

contract OptionalDeepTest {
    myData: OptionalNested?;

    init() {
        self.myData = null;
    }
}
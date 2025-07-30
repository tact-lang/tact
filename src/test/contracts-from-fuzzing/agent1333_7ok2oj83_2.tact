struct OptionalLayer {
    someVal: Int?;
    flag: Bool?;
}

contract OptTest {
    optData: OptionalLayer;

    init() {
        self.optData = OptionalLayer{ someVal: null, flag: true };
    }
}
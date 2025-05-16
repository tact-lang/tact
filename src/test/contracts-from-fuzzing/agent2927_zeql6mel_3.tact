struct OptNested {
    value: Int?;
    flag: Bool?;
}

contract OptTest {
    param: OptNested;

    init() {
        self.param = OptNested{
            value: null,
            flag: true
        };
    }
}
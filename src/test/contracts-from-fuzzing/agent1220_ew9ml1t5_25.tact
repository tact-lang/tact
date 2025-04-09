struct OptionalInside {
    f: Int?;
}

contract OptionalStructFieldTest {
    data: OptionalInside;

    init() {
        self.data = OptionalInside { f: null };
    }
}
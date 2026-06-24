struct Wrapper {
    optInt: Int?;
    optBool: Bool?;
}

contract OptionalStructTest {
    w: Wrapper;

    init() {
        self.w = Wrapper{ optInt: null, optBool: true };
    }
}

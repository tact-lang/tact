struct OptTest {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
}

contract TestContract {
    data: OptTest;

    init() {
        self.data = OptTest{
            optInt: null,
            optBool: null,
            optAddress: null,
        };
    }
}

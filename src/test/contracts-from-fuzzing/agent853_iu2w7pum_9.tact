struct OptStruct {
    str: String?;
    addr: Address?;
    num: Int?;
}

contract OptStructTest {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}
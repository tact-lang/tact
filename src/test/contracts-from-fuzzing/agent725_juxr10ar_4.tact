struct OptionalNested {
    val: Int?;
    flag: Bool?;
    addr: Address?;
}

contract OptionalTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            val: null,
            flag: null,
            addr: null
        };
    }
}
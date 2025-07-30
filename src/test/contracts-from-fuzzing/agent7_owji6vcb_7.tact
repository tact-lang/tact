struct OptionalNested {
    val: Int?;
    flag: Bool?;
}

contract Test {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{
            val: null,
            flag: null
        };
    }
}
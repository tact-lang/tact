struct OptionalNested {
    val: Int?;
    flag: Bool?;
}

contract ContractOptionalNested {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            val: null,
            flag: true,
        };
    }
}

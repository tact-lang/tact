struct OptionalNested {
    val: Int?;
    flag: Bool?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            val: null,
            flag: true,
        };
    }
}
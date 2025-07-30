struct OptionalNested {
    val: Int?;
    flag: Bool?;
}

contract TestContract {
    storage: OptionalNested;

    init() {
        self.storage = OptionalNested{
            val: null,
            flag: true
        };
    }
}
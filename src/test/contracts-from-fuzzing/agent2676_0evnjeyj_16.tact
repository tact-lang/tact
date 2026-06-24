struct OptionalNum {
    value: Int?;
}

contract OptionalWrapper {
    data: OptionalNum? = null;

    init() {
        self.data = OptionalNum{ value: 777 };
    }
}
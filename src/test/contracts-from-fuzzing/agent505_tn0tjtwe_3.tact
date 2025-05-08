struct OptNested {
    val: Int?;
    flag: Bool?;
}

contract OptionalNested {
    data: OptNested;

    init() {
        self.data = OptNested{val: null, flag: null};
    }
}

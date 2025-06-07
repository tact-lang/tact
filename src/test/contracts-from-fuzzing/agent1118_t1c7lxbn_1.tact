struct OptionalStruct {
    val: Int?;
    flag: Bool?;
}

contract TestContract {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{val: null, flag: null};
    }
}
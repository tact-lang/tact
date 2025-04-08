struct OptionalStruct {
    val: Int?;
}

contract TestContract {
    a: OptionalStruct;

    init() {
        self.a = OptionalStruct{val: null};
    }
}
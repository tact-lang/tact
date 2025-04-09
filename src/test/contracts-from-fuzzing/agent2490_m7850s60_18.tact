struct OptIntStruct {
    value: Int?;
}

contract OptIntStructContract {
    data: OptIntStruct;

    init() {
        self.data = OptIntStruct{value: null};
    }
}
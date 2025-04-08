struct OptionalStruct {
    num: Int? = null;
    txt: String? = null;
    flag: Bool? = null;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            num: null,
            txt: null,
            flag: null
        };
    }
}
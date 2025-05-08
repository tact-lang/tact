struct OptionalStruct {
    flag: Bool;
    optVal: Int?;
}

contract OptionalTest {
    ss: OptionalStruct;

    init() {
        self.ss = OptionalStruct{flag: true, optVal: null};
    }
}
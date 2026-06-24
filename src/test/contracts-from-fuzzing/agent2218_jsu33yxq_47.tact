struct OptionalStringStruct {
    s: String?;
}

contract OptStringTest {
    data: OptionalStringStruct;
    init() {
        self.data = OptionalStringStruct{s:null};
    }
}
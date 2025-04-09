struct OptionalBoolStruct {
    flag1: Bool?;
    flag2: Bool?;
}

contract OptBoolStructTest {
    flags: OptionalBoolStruct;
    init() {
        self.flags = OptionalBoolStruct{
            flag1: null,
            flag2: true
        };
    }
}
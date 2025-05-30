struct OptionalBoolStruct {
    first: Bool?;
    second: Bool?;
    third: Bool?;
    fourth: Bool?;
}

contract OptionalBoolsInStructTest {
    var: OptionalBoolStruct;

    init() {
        self.var = OptionalBoolStruct{
            first: true,
            second: null,
            third: false,
            fourth: null
        };
    }
}

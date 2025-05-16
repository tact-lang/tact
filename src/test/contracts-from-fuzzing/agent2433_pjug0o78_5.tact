struct OptionalInOptionalStruct {
    outer: InnerOptional?;
}

struct InnerOptional {
    a: Int?;
    b: Bool?;
}

contract OptionalInsideOptionalTest {
    data: OptionalInOptionalStruct;

    init() {
        self.data = OptionalInOptionalStruct{
            outer: null
        };
    }
}
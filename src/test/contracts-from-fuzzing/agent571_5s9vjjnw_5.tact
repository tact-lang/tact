struct OptionalInOptional {
    foo: Int?;
}

struct TopStruct {
    bar: OptionalInOptional?;
}

contract OptionalInOptionalTest {
    val: TopStruct;

    init() {
        self.val = TopStruct{bar: null};
    }
}
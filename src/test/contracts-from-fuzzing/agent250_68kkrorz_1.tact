struct InnerStruct {
    flag: Bool;
    count: Int?;
}

contract DeepOptionalTest {
    nested: InnerStruct?;

    init() {
        self.nested = null;
    }
}
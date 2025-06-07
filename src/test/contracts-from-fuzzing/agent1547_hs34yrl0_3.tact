struct OptionalNested {
    first: Int?;
    second: Bool?;
    third: InnerStruct?;
}

struct InnerStruct {
    val: String;
}

contract OptionTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            first: null,
            second: true,
            third: InnerStruct{ val: "xyz" },
        };
    }
}
struct OptionalNested2 {
    a: Int?;
    b: String?;
}

struct OuterOptStruct {
    nested: OptionalNested2?;
    flag: Bool;
}

contract OptionalNestedStructContract {
    data: OuterOptStruct;

    init() {
        self.data = OuterOptStruct{
            nested: null,
            flag: false,
        };
    }
}
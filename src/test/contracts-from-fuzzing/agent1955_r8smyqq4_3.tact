struct InnerStruct {
    val: Int?;
    flag: Bool?;
}

struct OuterVariant {
    nested: InnerStruct?;
    info: String?;
}

contract OptNested {
    data: OuterVariant;

    init() {
        self.data = OuterVariant{
            nested: InnerStruct{
                val: 42,
                flag: true,
            },
            info: null,
        };
    }
}

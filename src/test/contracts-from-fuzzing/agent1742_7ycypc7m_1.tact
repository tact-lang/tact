struct InnerLevel {
    innerVal: Int = 1;
    optionalInner: String?;
}

struct OuterLevel {
    nested: InnerLevel;
    optionalOuter: Bool?;
}

contract NestedStructContract {
    storageField: OuterLevel;

    init() {
        self.storageField = OuterLevel{
            nested: InnerLevel{innerVal: 42},
        };
    }
}
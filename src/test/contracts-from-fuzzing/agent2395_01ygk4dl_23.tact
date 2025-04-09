struct OuterOption {
    value: InnerOption?;
}

struct InnerOption {
    x: Int?;
    str: String?;
}

contract NestedOptionalFields {
    data: OuterOption;
    init() {
        self.data = OuterOption{
            value: InnerOption{ x:null, str:null }
        };
    }
}

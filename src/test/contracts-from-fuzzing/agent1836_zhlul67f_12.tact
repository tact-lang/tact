struct OptionalInner {
    mark: Int?;
    txt: String?;
}

struct OuterWithOptInner {
    id: Int;
    note: OptionalInner;
}

contract NestedOptionalInner {
    storage: OuterWithOptInner;

    init() {
        self.storage = OuterWithOptInner{
            id: 1,
            note: OptionalInner{
                mark:null, txt:null,
            },
        };
    }
}
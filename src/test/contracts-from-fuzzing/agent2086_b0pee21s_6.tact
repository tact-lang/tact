struct InnerOpt {
    note: String;
}

struct OuterOpt {
    innerMaybe: InnerOpt?;
    num: Int;
}

contract OptionalNestedStruct {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            innerMaybe: null,
            num: 5
        };
    }
}
struct Nested2 {
    flag: Bool;
}

struct Nested1 {
    count: Int;
    nested2: Nested2;
}

struct RootStruct {
    num: Int;
    nested: Nested1;
    optionalInner: Nested2?;
}

contract StructContract {
    data: RootStruct;

    init() {
        self.data = RootStruct{
            num: 2,
            nested: Nested1{
                count: 3,
                nested2: Nested2{ flag: true },
            },
            optionalInner: null,
        };
    }
}

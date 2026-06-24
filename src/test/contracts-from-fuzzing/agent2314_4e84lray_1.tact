struct NestedInner {
    flag: Bool;
    count: Int?;
}

struct NestedOuter {
    item: NestedInner; 
    note: String;
}

contract TestNestedComplex {
    complexField: NestedOuter;

    init() {
        self.complexField = NestedOuter{
            item: NestedInner{
                flag: true,
                count: null
            },
            note: "hello"
        };
    }
}
struct Child {
    data: Int;
    note: String?;
    flag: Bool?;
}

struct Parent {
    first: Child;
    second: Child;
    third: Child;
}

contract MultipleNestedStructs {
    storage: Parent;
    
    init() {
        self.storage = Parent{
            first: Child{ data: 1, note: "a", flag: null },
            second: Child{ data: 2, note: null, flag: true },
            third: Child{ data: 3, note: "c", flag: false }
        };
    }
}
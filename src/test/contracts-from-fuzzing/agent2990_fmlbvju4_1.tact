struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    count: Int?;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{ inner: InnerStruct{ flag: true, count: null } };
    }
}
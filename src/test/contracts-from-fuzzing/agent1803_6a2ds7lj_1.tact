struct Nested {
    deep: Inner;
}

struct Inner {
    flag: Bool;
    count: Int?;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested {
            deep: Inner {
                flag: true,
                count: null,
            },
        };
    }
}
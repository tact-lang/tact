struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    amount: Int?;
}

contract TestDeepNested {
    data: Nested;
    
    init() {
        self.data = Nested{
            inner: Inner{
                flag: true,
                amount: 123,
            }
        };
    }
}
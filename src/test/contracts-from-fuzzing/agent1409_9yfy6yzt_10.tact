struct Inner {
    foo: Int?;
    bar: Bool?;
}

struct Second {
    inner: Inner;
    comment: String;
}

struct Third {
    s: Second;
    address: Address?
}

contract MultiNested {
    data: Third;
    
    init() {
        self.data = Third{
            s: Second{
                inner: Inner{ foo: null, bar: true },
                comment: "test"
            },
            address: null
        };
    }
}

struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    value: Int?;
}

contract DeepOptional {
    state: Nested;
    
    init() {
        self.state = Nested{
            inner: Inner{
                flag: true,
                value: null
            }
        };
    }
}

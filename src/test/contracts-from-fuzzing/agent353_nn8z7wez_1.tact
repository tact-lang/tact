struct Nested {
    inner: Inner;
}

struct Inner {
    deep: DeepOpt?;
}

struct DeepOpt {
    level: Int?;
}

contract DeepOptContract {
    data: Nested;
    
    init() {
        self.data = Nested{
            inner: Inner{
                deep: DeepOpt{
                    level: null
                }
            }
        };
    }
}
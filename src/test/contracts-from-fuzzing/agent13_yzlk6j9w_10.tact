struct DeepOptionals {
    inner: Int?;
}

struct Nesting {
    first: DeepOptionals?;
    second: DeepOptionals?;
    third: DeepOptionals?;
}

contract OptionalChain {
    data: Nesting?;
    
    init() {
        self.data = null;
    }
}
struct NestingOption {
    f: Int?;
    g: Bool;
}

contract OptionalStructDirect {
    f: NestingOption?;
    
    init() {
        self.f = null;
    }
}
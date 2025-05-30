struct OptionalNest {
    nested: Int?;
}

contract OptInStructOpt {
    f: OptionalNest?;
    
    init() {
        self.f = null;
    }
}

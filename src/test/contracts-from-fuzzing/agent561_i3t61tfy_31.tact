struct OptionalStrNest {
    a: String?;
    b: String?;
}

contract StoreOptStrNest {
    x: OptionalStrNest;

    init() {
        self.x = OptionalStrNest{
            a:null,
            b:null
        };
    }
}
struct MixedDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
}

contract TestContract {
    m: MixedDefault;

    init() {
        self.m = MixedDefault{
            d: null
        };
    }
}
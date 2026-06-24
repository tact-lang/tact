struct OptInner {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptInnerStructContract {
    storage: OptInner;

    init() {
        self.storage = OptInner{
            optInt: null,
            optBool: null,
            optStr: null,
        };
    }
}
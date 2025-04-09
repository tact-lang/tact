struct InnerOpt {
    val: Int?;
}

contract MixedOptStructs {
    a: InnerOpt?;
    b: InnerOpt?;

    init() {
        self.a = InnerOpt{val: null};
        self.b = null;
    }
}
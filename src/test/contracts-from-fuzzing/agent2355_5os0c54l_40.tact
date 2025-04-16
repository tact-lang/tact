struct OptionalBoolStr {
    b: Bool?;
    s: String?;
}

contract OptBoolAndStr {
    f: OptionalBoolStr;

    init() {
        self.f = OptionalBoolStr{ b:true, s:"hello" };
    }
}
struct OptionalWithDefault {
    a: Int?;
    b: Int = 7;
}

contract TestContract {
    d: OptionalWithDefault;
    init() {
        self.d = OptionalWithDefault{ a:null };
    }
}
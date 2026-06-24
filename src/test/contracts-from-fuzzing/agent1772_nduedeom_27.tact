struct OptBool {
    x: Bool?;
}

contract BoolOptionalContract {
    v: OptBool;

    init() {
        self.v = OptBool{ x:null };
    }
}
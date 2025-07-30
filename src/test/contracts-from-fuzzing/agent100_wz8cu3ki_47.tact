struct OptionalBool {
    val: Bool?;
}

contract Test48 {
    d: OptionalBool;

    init() {
        self.d = OptionalBool{ val:null };
    }
}
struct OptStrBool {
    s: String?;
    b: Bool?;
}

contract OptionalStringBool {
    val: OptStrBool;

    init() {
        self.val = OptStrBool{ s:null, b:null };
    }
}
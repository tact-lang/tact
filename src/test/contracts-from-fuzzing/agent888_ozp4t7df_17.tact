struct OptStr {
    s: String?;
}

contract SingleOptionalString {
    val: OptStr;
    init() {
        self.val = OptStr{ s:null };
    }
}
// Persistent String fields with empty string default
contract EmptyStringDefault {
    s1: String = "";
    s2: String? = "";

    init() {
        self.s1 = "foo";
        self.s2 = "bar";
    }
}
struct WithOptionalDefault {
    val: Int? = null;
}

contract OptionalDefaultField {
    s: WithOptionalDefault;

    init() {
        self.s = WithOptionalDefault{ val:null };
    }
}
struct S {
    text: String?;
    num: Int? = null;
}

contract OptDefaults {
    val: S;
    init() {
        self.val = S{
            text: null,
            num: null
        };
    }
}
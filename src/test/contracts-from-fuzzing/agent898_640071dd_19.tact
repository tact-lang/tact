struct HasOptionalString {
    s1: String?;
    s2: String?;
}

contract StoredOptString {
    val: HasOptionalString;

    init() {
        self.val = HasOptionalString{
            s1:null,
            s2:null,
        };
    }
}

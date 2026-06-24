struct HasString {
    s1: String;
    s2: String?;
}

contract TestContract {
    strct: HasString;

    init() {
        self.strct = HasString{
            s1: "mandatory",
            s2: null
        };
    }
}
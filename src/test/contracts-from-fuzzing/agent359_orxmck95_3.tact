struct StringNest {
    name: String;
    desc: String?;
}

contract TestContract {
    details: StringNest;

    init() {
        self.details = StringNest{ name: "Hello", desc: null };
    }
}
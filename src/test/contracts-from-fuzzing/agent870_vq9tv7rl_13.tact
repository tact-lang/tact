struct StringNest {
    val: String;
    opt: String?;
}

contract TestString {
    sNest: StringNest = StringNest{ val: "abc", opt: null };

    init() {
        self.sNest = StringNest{
            val: "updated",
            opt: "optional"
        };
    }
}

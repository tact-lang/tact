struct EmptyStringsAndNulls {
    s1: String? = null;
    s2: String = "";
    s3: String? = "";
    s4: String? = null;
}

contract TestEmptyStrings {
    val: EmptyStringsAndNulls = EmptyStringsAndNulls{};

    init() {
        self.val = EmptyStringsAndNulls{
            s1: "hi",
            s2: "bye",
            s3: null,
            s4: "ok"
        };
    }
}
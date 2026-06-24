struct Nested {
    id: Int;
    optString: String?;
}

contract OptionalAndNonOptional {
    maybeNested: Nested?;
    sureNested: Nested;

    init() {
        self.maybeNested = null;
        self.sureNested = Nested{ id:1, optString:null };
    }
}
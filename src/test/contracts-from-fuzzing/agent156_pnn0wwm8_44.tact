struct NestedMixed {
    o: Int?;
    s: String;
}

contract OptNestedMixed {
    nm: NestedMixed?;

    init() {
        self.nm = NestedMixed{ o: null, s: "txt" };
    }
}

struct NestedOptStr {
    i: Int?;
}

contract NestedOptStructField {
    so: NestedOptStr;
    init() {
        self.so = NestedOptStr{ i: null };
    }
}
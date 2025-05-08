struct NestedNullable {
    maybeInt: Int?;
    maybeStr: String?;
}

contract StorageNullable {
    f: NestedNullable;

    init() {
        self.f = NestedNullable{ maybeInt:null, maybeStr:null };
    }
}
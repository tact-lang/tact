struct NestedAll {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedInside {
    payload: NestedAll?;

    init() {
        self.payload = null;
    }
}
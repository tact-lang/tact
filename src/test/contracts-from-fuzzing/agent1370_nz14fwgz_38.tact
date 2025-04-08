// Persistent variable String? with explicit default null (should be implicit anyway)
contract StringNullable {
    s: String?;

    init() {
        self.s = null;
    }
}
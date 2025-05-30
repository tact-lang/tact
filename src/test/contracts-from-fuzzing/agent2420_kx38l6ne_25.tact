struct OptionalString {
    s: String?;
}
contract OptStringTop {
    os: OptionalString;

    init() {
        self.os = OptionalString{ s: null };
    }
}
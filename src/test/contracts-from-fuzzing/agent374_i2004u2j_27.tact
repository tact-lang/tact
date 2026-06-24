// Optional primitive defaults
contract TestContract {
    oi: Int? = null;
    ob: Bool? = null;
    os: String? = null;

    init() {}

    receive() {
        if (self.oi != null) {
            let _ = self.oi!!;
        }
    }
}
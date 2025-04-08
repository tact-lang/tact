struct Bundle {
    content: Cell?;
    note: String?;
}

contract TestContract {
    bundle: Bundle?;

    init() {
        self.bundle = null;
    }
}
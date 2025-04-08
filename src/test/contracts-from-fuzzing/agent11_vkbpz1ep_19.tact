struct Wrapper {
    optStr: String?;
    flag: Bool;
}

contract TestContract {
    field: Wrapper?;

    init() {
        self.field = null;
    }
}
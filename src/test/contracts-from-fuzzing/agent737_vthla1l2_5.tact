struct OptNested {
    inner: Int?;
    flag: Bool;
}

contract OptNestedInContract {
    state: OptNested?;

    init() {
        self.state = null;
    }
}
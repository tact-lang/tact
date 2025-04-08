struct Defaults {
    count: Int = 5;
    active: Bool = true;
}

contract Test {
    state: Defaults?;

    init() {
        self.state = null;
    }

    receive() {}
}
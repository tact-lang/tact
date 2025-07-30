message Msg {
    field: Int;
}

contract TestUnderscore {
    state: Int = 0;

    receive(_: Msg) {
        self.state = 42;
    }

    // dummy fallback receiver to ensure full compilation
    receive() {}
}

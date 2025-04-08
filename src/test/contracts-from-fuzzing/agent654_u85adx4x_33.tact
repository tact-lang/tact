message Info {
    value: Int;
}

contract C {
    data: Info?;

    init() {
        self.data = null;
    }
}
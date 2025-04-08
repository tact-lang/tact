struct Boo {
    value: Int as uint8;
}

contract TestContract {
    state: Boo;

    init() {
        self.state = Boo{value: 255};
    }
}
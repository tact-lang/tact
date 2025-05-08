struct Holder {
    text: String = "";
    count: Int;
}

contract TestContract {
    stored: Holder;

    init() {
        self.stored = Holder{ count: 1 };
    }
}
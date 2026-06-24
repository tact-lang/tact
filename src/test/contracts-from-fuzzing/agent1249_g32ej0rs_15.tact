message(256) Msg {
    a: Int = 11;
    b: Bool = true;
    c: String = "hi";
    d: Int?; // implicit null default
}

contract TestContract {
    data: Msg;

    init() {
        self.data = Msg{
            a: 77,
            d: null,
            // omit b, c => use defaults
        };
    }
}
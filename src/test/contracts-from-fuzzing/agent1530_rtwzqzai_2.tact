struct Params {
    flag: Bool = false;
    count: Int?;
    note: String = "";
}

contract TestContract {
    state: Params;

    init() {
        self.state = Params{ };
    }
}

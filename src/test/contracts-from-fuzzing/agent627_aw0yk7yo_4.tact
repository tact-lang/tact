struct Params {
    flag: Bool = true;
    count: Int = 0;
    note: String = "";
}

contract TestContract {
    params: Params;

    init() {
        self.params = Params{};
    }
}
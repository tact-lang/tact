struct DefOpt {
    flag: Bool? = null;
    id: Int? = null;
    txt: String? = null;
    addr: Address? = null;
}

contract TestContract {
    data: DefOpt;

    init() {
        self.data = DefOpt{}; // use default null values
    }
}
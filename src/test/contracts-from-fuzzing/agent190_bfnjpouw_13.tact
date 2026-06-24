struct DefOptNonNull {
    flag: Bool? = true;
    id: Int? = 42;
    note: String? = "hi";
}

contract TestContract {
    data: DefOptNonNull;

    init() {
        self.data = DefOptNonNull{}; // use those defaults
    }
}
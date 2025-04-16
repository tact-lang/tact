struct SingleOpt {
    foo: Int?;
}

contract TestContract {
    data: SingleOpt;

    init() {
        self.data = SingleOpt{foo: null};
    }
}
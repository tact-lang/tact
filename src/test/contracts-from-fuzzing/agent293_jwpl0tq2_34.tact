struct SimpleOption {
    opt: Int?;
}

contract SimpleOptContract {
    val: SimpleOption;

    init() {
        self.val = SimpleOption{opt: null};
    }
}
struct OneFieldOption {
    x: Int?;
}

contract Test {
    data: OneFieldOption;

    init() {
        self.data = OneFieldOption{x:null};
    }
}
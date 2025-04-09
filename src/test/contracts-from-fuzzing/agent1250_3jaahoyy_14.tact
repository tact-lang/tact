struct IntOption {
    o: Int?;
}

contract TestContract {
    opt: IntOption = IntOption{o:null};

    init() {
        self.opt = IntOption{o:7};
    }
}
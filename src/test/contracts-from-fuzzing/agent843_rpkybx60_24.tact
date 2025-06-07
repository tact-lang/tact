struct ABC {
    aa: Int;
    bb: Bool?;
    cc: Int?;
}

contract StructOpt {
    a: ABC?;

    init() {
        self.a = ABC{ aa: 42, bb: null, cc: 7 };
    }
}

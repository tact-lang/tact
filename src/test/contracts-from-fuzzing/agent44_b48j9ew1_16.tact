struct SingleOptional {
    piece: Int?;
}

contract OptStruct {
    data: SingleOptional;

    init() {
        self.data = SingleOptional{ piece: null };
    }

    receive() {
        self.data = SingleOptional{ piece: 77 };
    }
}
struct DeepStruct {
    l1: Int;
    l2: Int;
}

contract InitDefaults {
    s: DeepStruct = DeepStruct{l1: 1, l2: 2};

    init() {
        self.s = DeepStruct{l1: 3, l2: 4};
    }
}
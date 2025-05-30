struct DeepStruct {
    level: Int;
}

contract Layers {
    l1: DeepStruct;
    l2: DeepStruct;

    init() {
        self.l1=DeepStruct{level:1}; self.l2=DeepStruct{level:2};
    }
}
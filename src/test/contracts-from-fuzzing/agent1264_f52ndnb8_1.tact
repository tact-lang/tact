struct NestedOpt {
    val1: Int?; 
    val2: Bool?;
    val3: Int?; 
}

contract DeepOptional {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{ val1: null, val2: true, val3: null };
    }
}

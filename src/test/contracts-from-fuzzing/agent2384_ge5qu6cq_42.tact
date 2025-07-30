struct MultiInits {
    i: Int = 1;
    b: Bool?;
    s: String = "hi";
}

contract MultiStructDefaults {
    data: MultiInits;

    init() {
        self.data = MultiInits{b:null};
    }
}
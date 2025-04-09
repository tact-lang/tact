struct Deep {
    val: Int?; 
}

contract InitNullOption {
    d: Deep;

    init() {
        self.d = Deep{val:null};
    }
}
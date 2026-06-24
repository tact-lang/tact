struct Inner {
    flag: Bool?;
    number: Int?;
}

contract OptInStruct {
    inf: Inner?;

    init() {
        self.inf = null;
    }
}

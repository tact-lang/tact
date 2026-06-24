struct MultiOption {
    s1: String?;
    s2: String?;
    s3: String?;
    i1: Int?;
    i2: Int?;
    i3: Int?;
}

contract LotsOfOptionals {
    data: MultiOption?;
    data2: MultiOption?;

    init() {
        self.data = null;
        self.data2 = null;
    }
}

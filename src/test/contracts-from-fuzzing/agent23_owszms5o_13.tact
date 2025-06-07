struct InnerMost {
    x: Int?;
    y: String?;
}

struct Mid {
    leaf: InnerMost?;
}

contract OptStructInStruct {
    m: Mid? = null;

    init() {
        self.m = Mid{ leaf: InnerMost{ x:5, y:"abc" } };
    }
}
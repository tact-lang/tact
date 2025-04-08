struct InnerMost {
    v1: Int?; 
    v2: Bool?; 
    v3: String?;
}

struct MiddleNest {
    im: InnerMost?;
    flag: Bool?;
}

contract MultiOptionalNest {
    data: MiddleNest = MiddleNest{
        im: null,
        flag: null
    };

    init() {
        self.data = MiddleNest{
            im: null,
            flag: null
        };
    }
}
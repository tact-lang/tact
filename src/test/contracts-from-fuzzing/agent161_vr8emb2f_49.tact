// nested optional struct
struct DeepOptStruct {
    inner: MiddleOpt?;
}

struct MiddleOpt {
    leafOpt: LeafOpt?;
}

struct LeafOpt {
    value: Int?;
}

contract ManyOptNested {
    data: DeepOptStruct;

    init() {
        self.data = DeepOptStruct {
            inner: null,
        };
    }
}

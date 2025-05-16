struct Wrapper {
    payload: DataOpt?;
}

struct DataOpt {
    name: String?;
    active: Bool?;
}

contract OuterOptional {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            payload: null
        };
    }
}
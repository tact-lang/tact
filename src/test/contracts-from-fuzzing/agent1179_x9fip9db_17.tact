contract DeepOptionals {
    optStruct: OptStruct?;

    init() {
        self.optStruct = null;
    }

    receive() {}
}

struct OptStruct {
    innerOpt: Inner?;
}

struct Inner {
    num: Int?;
    flag: Bool?;
}
struct OptDeepStruct {
    inner: Inner?;
}

struct Inner {
    x: Int?;
}

contract DeepOpt {
    s: OptDeepStruct;

    init() {
        self.s = OptDeepStruct{ inner: null };
    }
}
struct NestedOpt {
    deepOpt: Int?;
}

struct OuterOpt {
    inner: NestedOpt?;
}

contract DeepOptionals {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{ inner: null };
    }
}
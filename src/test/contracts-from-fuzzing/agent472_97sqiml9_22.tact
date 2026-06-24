struct Nullable {
    a: Int?;
    b: Bool?;
}

struct NullableNest {
    n: Nullable?;
}

contract DeepOpt {
    nn: NullableNest;

    init() {
        self.nn = NullableNest{ n:null };
    }
}
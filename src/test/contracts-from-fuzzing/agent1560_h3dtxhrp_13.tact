struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    inner: InnerOpt;
    z: String?;
}

contract TestContract {
    nested: OuterOpt = OuterOpt{inner: InnerOpt{x: null, y: null}, z: null};
}
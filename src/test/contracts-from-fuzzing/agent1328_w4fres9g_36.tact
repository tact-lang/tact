// optional struct with nested optional field as null
struct InnerOpt {
    k: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract ComplexOpt {
    val: OuterOpt? = null;
    init() {
        self.val = null;
    }
}
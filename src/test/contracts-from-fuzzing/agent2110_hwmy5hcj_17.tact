// Struct containing optional struct, field initialized to non-null but inner null
struct InnerOpt {
    val: Int?;
}

struct Container {
    inner: InnerOpt?;
}

contract OptStructInit {
    s: Container;
    init() {
        self.s = Container{
            inner: InnerOpt{ val: null }
        };
    }
}
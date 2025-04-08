// optional struct with optional inner struct
struct InnerOpt2 {
    x: Int;
}

struct OuterOpt2 {
    inner: InnerOpt2?;
}

contract ComplexOptTest {
    data: OuterOpt2?;
    init() {
        self.data = OuterOpt2{
            inner: null
        };
    }
}
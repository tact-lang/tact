// test deeply nested optional inside struct in a contract variable
struct DeepOption {
    a: Int?;
    b: Int;
}

struct Wrapper {
    inner: DeepOption?;
}

contract TestOpt {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            inner: null
        };
    }
}
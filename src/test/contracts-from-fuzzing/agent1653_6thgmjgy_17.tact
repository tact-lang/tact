// Unusual ordering: deep nested struct + optionals before non-optional scalar
struct DeepOpt {
    optInt: Int?;
    optBool: Bool?;
}

struct Wrapper {
    inner: DeepOpt;
}

contract TestContract {
    wrp: Wrapper;
    x: Int;

    init() {
        self.wrp = Wrapper{
            inner: DeepOpt{
                optInt: null,
                optBool: true
            }
        };
        self.x = 42;
    }
}
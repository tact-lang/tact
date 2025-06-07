// test empty optional struct default 
struct Foo { x: Int }

struct WrapOpt {
    inner: Foo?;
}

contract Test {
    w: WrapOpt;
    init() {
        self.w = WrapOpt{inner: null};
    }
}
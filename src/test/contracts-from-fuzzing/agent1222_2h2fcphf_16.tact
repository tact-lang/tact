struct A { x: Int }
struct B { y: Int }

struct Wrapper {
    a: A?;
    b: B?;
}

contract TestMultiOpt {
    w: Wrapper;
    init() {
        self.w = Wrapper{
            a: null,
            b: B{ y: 42 }
        };
    }
}
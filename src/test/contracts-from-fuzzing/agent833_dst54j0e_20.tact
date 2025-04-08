// Struct with multiple optional nested structs
struct Wrapper {
    a: Child?;
    b: Child?;
}

struct Child {
    x: Int = 11;
    y: Bool = true;
}

contract TestContract {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{
            a: Child{},
            b: null,
        };
    }
}

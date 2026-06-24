struct Inner1 { x: Int }
struct Inner2 { y: Int }
struct Container {
    first: Inner1;
    second: Inner2;
}

contract MultipleDistinctNested {
    cont: Container;
    init() {
        self.cont = Container{
            first: Inner1{ x: 1 },
            second: Inner2{ y: 2 },
        };
    }
}
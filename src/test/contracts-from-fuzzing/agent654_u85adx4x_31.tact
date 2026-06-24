message M {}

struct Container {
    m: M;
    num: Int as uint32;
}

contract C {
    data: Container;

    init() {
        self.data = Container{
            m: M{},
            num: 42,
        };
    }
}
struct Defaulted {
    x: Int = 0;
}

struct Container {
    wrapped: Defaulted;
    flag: Bool;
}

contract NestedDefaulted {
    data: Container;
    init() {
        self.data = Container{
            wrapped: Defaulted{},
            flag: true
        };
    }
}
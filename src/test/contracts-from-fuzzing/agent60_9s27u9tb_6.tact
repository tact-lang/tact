struct OptNest {
    inner: Bool?;
}

struct Container {
    value: OptNest?;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            value: OptNest{ inner: true }
        };
    }
}
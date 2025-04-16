message(42) Info {
    count: Int;
}

struct Container {
    info: Info?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            info: Info{ count: 5 }
        };
    }
}
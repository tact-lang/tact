message(0x3333) EmptyMsg {}

struct Container {
    m: EmptyMsg?;
}

contract TestContract {
    data: Container;
    init() {
        self.data = Container{};
    }
}
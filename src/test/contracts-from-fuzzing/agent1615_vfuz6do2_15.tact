struct Info {
    data: Int;
}

struct Container {
    content: Info? = Info{ data: 42 };
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{};
    }

    receive() {}
}
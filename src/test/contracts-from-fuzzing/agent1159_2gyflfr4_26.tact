struct Details {
    flag: Bool = true;
    note: String = "default";
}

struct Container {
    info: Details? = null;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{};
    }
}
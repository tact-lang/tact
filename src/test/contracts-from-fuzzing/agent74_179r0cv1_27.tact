struct Info {
    name: String = "Satoshi";
    email: String?;
}

struct Container {
    data: Info;
    count: Int;
}

contract TestContract {
    state: Container;

    init() {
        self.state = Container{ data: Info{}, count: 555 };
    }
}
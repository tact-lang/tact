message Empty {}

struct Container {
    x: Empty;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{ x: Empty{} };
    }
}

message(1) InnerMsg { x: Int; }

struct Container {
    m: InnerMsg;
    val: Int;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            m: InnerMsg{ x: 9 },
            val: 5
        };
    }
}
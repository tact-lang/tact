message(17) Ping {
    v: Int = 100;
}

struct Container {
    inner: Ping;
}

contract TestContract {
    cont: Container;
    init() {
        self.cont = Container{ inner: Ping{} };
    }
}
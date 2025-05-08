struct Inner {
    flag: Bool;
}

struct Container {
    inner: Inner?;
}

contract TestContract {
    data: Container = Container{ inner: null };

    receive() {
        self.data = Container{ inner: Inner{ flag: true } };
    }
}

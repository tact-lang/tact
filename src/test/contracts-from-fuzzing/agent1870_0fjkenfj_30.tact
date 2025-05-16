struct OptFlag {
    flag: Bool?;
}

struct Container {
    inner: OptFlag?;
}

contract OptInOpt {
    data: Container;

    init() {
        self.data = Container{ inner: null };
    }
}

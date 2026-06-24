struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    inner: OptStruct?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{ inner: null };
    }
}
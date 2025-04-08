struct OptNested {
    oi: Int?;
    os: String?;
}

struct Container {
    val: OptNested?;
}

contract TestContract {
    payload: Container;

    init() {
        self.payload = Container{ val: null };
    }
}
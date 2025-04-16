struct OptAddr {
    a: Address?;
}

struct Container {
    inner: OptAddr;
}

contract NestedOptionalAddr {
    data: Container;

    init() {
        self.data = Container{inner: OptAddr{a:null}};
    }
}
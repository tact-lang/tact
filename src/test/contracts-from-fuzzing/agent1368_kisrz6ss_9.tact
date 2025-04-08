struct OptionalNested {
    a: Int?;
    b: String?;
    c: Address?;
}

struct Container {
    inner: OptionalNested = OptionalNested{a: null, b: null, c: null};
    flag: Bool = true;
}

contract TestContract {
    store: Container = Container{inner: OptionalNested{a: null, b: null, c: null}};
    init() {}
    receive() {}
}
struct X {
    foo: Int = 7;
    bar: Bool = true;
}

contract TestContract {
    maybeX: X?;

    init() {
        self.maybeX = X{};
    }
}
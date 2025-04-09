struct X {
    val: Int;
}

contract OptionalFieldContract {
    x: X?;

    init() {
        self.x = X{val: 42};
    }
}

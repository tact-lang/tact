struct NestedOptionals {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{ a: null, b: true };
    }
}
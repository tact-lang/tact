struct InnerBool {
    v: Bool;
}

contract TestContract {
    a: InnerBool;

    init() {
        self.a = InnerBool{ v: true };
    }
}
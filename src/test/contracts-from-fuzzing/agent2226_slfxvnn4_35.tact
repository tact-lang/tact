struct A {
    s: String;
    n: Int?;
}

contract OptionalStructInContract {
    a: A?;

    init() {
        self.a = null;
    }
}

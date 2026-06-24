struct A {
    x: Int;
    y: String;
}

contract TestContract {
    a1: A;
    a2: A;
    a3: A;

    init() {
        self.a1 = A{x: 1, y: "one"};
        self.a2 = A{x: 2, y: "two"};
        self.a3 = A{x: 3, y: "three"};
    }
}
struct A {
    f1: Int = 1;
    f2: String = "default";
    f3: Bool = false;
}

contract Defaults {
    x: A;

    init() {
        self.x = A{};
    }
}
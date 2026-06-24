trait A {
    x: Int;
}
trait B {
    y: Bool;
}

contract TraitFieldsTest with A, B {
    x: Int;
    y: Bool;

    init() {
        self.x = 42;
        self.y = true;
    }
}

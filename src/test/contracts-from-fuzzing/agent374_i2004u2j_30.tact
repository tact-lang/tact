// Struct nested, many booleans and ints, defaults in inner
struct Inn {
    foo: Int = 7;
    b1: Bool = false;
    b2: Bool = true;
}

contract TestContract {
    inn: Inn;
    val: Int = 42;

    init() {
        self.inn = Inn{};
    }

    receive() {
        let _ = self.inn.foo;
        let _ = self.val;
    }
}
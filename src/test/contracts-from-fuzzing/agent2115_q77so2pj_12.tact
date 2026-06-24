// contract with uninitialized struct without default values
struct Bare {
    x: Int;
    y: Bool;
}

contract UninitCheck {
    s: Bare;
    init() {
        self.s = Bare{ x: 7, y: true };
    }
}
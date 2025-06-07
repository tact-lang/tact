// struct with multiple nested defaults and optionals
struct Deep {
    a: Int = 1;
    b: String?;
    c: Bool? = false;
    d: Cell?;
}

contract TestContract {
    var: Deep;

    init() {
        self.var = Deep{
            b: null,
            d: null
        };
    }
}
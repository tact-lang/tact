struct Defaulted {
    a: Int = 7;
}

contract ExplicitVsDefaulted {
    d1: Defaulted;
    d2: Defaulted;
    init() {
        self.d1 = Defaulted{}; // rely on default
        self.d2 = Defaulted{ a: 123 }; // explicit override
    }
}
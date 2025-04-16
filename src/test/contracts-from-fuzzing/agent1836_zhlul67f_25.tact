struct Place1 { inner: Int; } 

struct Place2 { inner: Int; }

contract ManyStructsStacked {
    f1: Place1;
    f2: Place2;
    f3: Place1;
    f4: Place2;
    f5: Place1;

    init() {
        self.f1 = Place1{ inner:1 };
        self.f2 = Place2{ inner:2 };
        self.f3 = Place1{ inner:3 };
        self.f4 = Place2{ inner:4 };
        self.f5 = Place1{ inner:5 };
    }
}
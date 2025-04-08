struct Rec1 {
    r2: Rec2;
}

struct Rec2 {
    r3: Rec3;
}

struct Rec3 {
    r4: Int;
}

contract TestContract {
    main: Rec1;

    init() {
        self.main = Rec1{ r2: Rec2{ r3: Rec3{ r4: 123 } } };
    }
}
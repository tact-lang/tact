struct SA { x: Int; }
struct SB { sa: SA; }

contract MultipleStructs {
    b: SB;

    init() {
        self.b = SB{ sa: SA{ x: 77 } };
    }
}

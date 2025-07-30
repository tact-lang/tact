struct ComplexA { a: Int; b: Bool }
struct ComplexB { c: ComplexA; d: String }

contract DefaultPartial {
    data: ComplexB;

    init() {
        self.data = ComplexB{ c: ComplexA{ a: 5, b: false }, d: "" };
    }
}

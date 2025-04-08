struct ComplexInit {
    a: Int? = null;
    b: Bool = false;
    c: String = "";
}

contract DefaultStructVals {
    data: ComplexInit;

    init() {
        self.data = ComplexInit{};
    }
}
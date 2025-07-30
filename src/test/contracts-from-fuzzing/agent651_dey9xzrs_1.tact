struct VerySimple { a: Int; }

contract SimpleContract {
    data: VerySimple;

    init() {
        self.data = VerySimple{ a: 123 };
    }
}
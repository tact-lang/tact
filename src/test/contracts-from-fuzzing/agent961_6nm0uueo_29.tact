struct NestedComplex {
    a: Int;
    b: Bool?;
    c: String;
}

contract NestedComplexContract {
    data: NestedComplex;

    init() {
        self.data = NestedComplex{ a:0, b:null, c:"hi" };
    }
}
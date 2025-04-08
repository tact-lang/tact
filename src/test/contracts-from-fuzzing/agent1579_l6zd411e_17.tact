struct N1 { a: Int?; }
struct N2 { b: N1?; }
contract NestedNullable {
    data: N2;
    init() {
        self.data = N2{b: null};
    }
    receive() {
        self.data.b = N1{a: 7};
    }
}
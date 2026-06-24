struct Base1 {
    x: Int;
}
struct Base2 {
    y: Bool;
}
struct Combined {
    a: Base1;
    b: Base2;
}

contract Test {
    data: Combined;

    init() {
        self.data = Combined{ a: Base1{ x:1 }, b: Base2{ y:true } };
    }
}
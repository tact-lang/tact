struct A { x: Int }
struct B { y: Int }
struct C { a: A; b: B }

contract MultiStructField {
    data: C;
    init() {
        self.data = C{ a: A{ x: 7 }, b: B{ y: 42 } };
    }
}
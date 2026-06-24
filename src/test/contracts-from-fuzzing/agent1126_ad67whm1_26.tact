struct A { val: Int }
struct B { a: A }
struct C { b: B }

contract CrossNested {
    state: C;
    init() {
        self.state = C{ b: B{ a: A{ val: 2024 } } };
    }
}
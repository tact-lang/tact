struct SimpleA { a: Int; }
struct SimpleB { b: Int; }
struct Wrapper { sa: SimpleA; sb: SimpleB; }

contract SeparateStructs {
    state: Wrapper;

    init() {
        self.state = Wrapper{ sa: SimpleA{ a:1 }, sb: SimpleB{ b:2 } };
    }
}

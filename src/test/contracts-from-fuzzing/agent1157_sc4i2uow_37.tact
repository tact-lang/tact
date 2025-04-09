struct Nest1 { a: Int }
struct Nest2 { b: Nest1 }
struct Nest3 { c: Nest2 }

contract DeepContract {
    d: Nest3;

    init() {
        self.d = Nest3{ c: Nest2{ b: Nest1{ a: 42 } } };
    }
}
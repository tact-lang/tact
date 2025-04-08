// deeply nested struct with trailing commas, defaults, mixing Booleans
struct A { x: Int; y: Bool = false }
struct B { a: A; flag: Bool }
struct C { b: B; n: Int = 7 }

contract TestContract {
    d: C;

    init() {
        self.d = C{
            b: B{
                a: A{ x: 1 },
                flag: true,
            },
        };
    }
}
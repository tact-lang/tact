// Test many nested levels struct with only required fields
struct A { x: Int = 1; }
struct B { a: A; y: Int = 2; }
struct C { b: B; z: Int = 3; }
struct D { c: C; k: Int = 4; }
struct E { d: D; q: Int = 5; }

contract TestContract {
    val: E;

    init() {
        self.val = E{
            d: D{
                c: C{
                    b: B{
                        a: A{ x: 42 },
                        y: 7
                    },
                    z: 11
                },
                k: 99
            },
            q: 17
        };
    }

    receive() {
        self.val = self.val;
    }
}
struct D { q: Int; }
struct C { d: D?; flag: Bool; }
struct B { c: C; }
struct A { b: B?; }

contract TestStorage {
    a: A;

    init() {
        self.a = A{
            b: B{
                c: C{
                    d: D{ q: 42 },
                    flag: true
                }
            }
        };
    }
}
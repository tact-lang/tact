struct A { val: Int; flag: Bool }
struct B { a: A? }
struct C { b: B }
struct D { c: C? }

contract DeepNestFull {
    data: D;
    init() {
        self.data = D{
            c: C{
                b: B{
                    a: A{
                        val: 123,
                        flag: true
                    }
                }
            }
        };
    }
}
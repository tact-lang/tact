struct D { val: Int; }
struct C { d: D; }
struct B { c: C; }
struct A { b: B; }

contract DeepNested {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{
                    d: D{ val: 777 }
                }
            }
        };
    }

    receive() {
        let _ = self.data.b.c.d.val;
    }
}
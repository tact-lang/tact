struct D { val: Int; }
struct C { d: D; flag: Bool; }
struct B { c: C; num: Int; }
struct A { b: B; ok: Bool; }

contract TestContract {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{
                    d: D{ val: 5 },
                    flag: true
                },
                num: 10
            },
            ok: false
        };
    }
}
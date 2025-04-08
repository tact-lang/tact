struct A { x: Int; y: Bool; z: String; }
struct B { a: A; foo: Int; bar: Bool; }
struct C { b: B; num: Int; str: String; }
struct D { c: C; s: String; n: Int; flag: Bool; }

contract ContractDeepNoOptionals {
    d: D;

    init() {
        self.d = D{
            c: C{
                b: B{
                    a: A{ x: 42, y: true, z: "hey" },
                    foo: 100,
                    bar: false,
                },
                num: 77,
                str: "deep",
            },
            s: "deeper",
            n: 123456,
            flag: true,
        };
    }
}

struct A {x: Int; y: String}
struct B {a: A; z: Int}
struct C {b: B; flag: Bool}

contract NestingChain {
    c: C;

    init() {
        self.c = C{
            b: B{
                a: A{
                    x: 1,
                    y: "abc"
                },
                z: 2
            },
            flag: true
        };
    }
}
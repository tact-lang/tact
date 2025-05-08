struct A {
    x: Int as uint32;
    y: Bool?;
}

struct B {
    s: String;
    o: Int?;
}

struct C {
    addr: Address?;
    coins: Int as coins;
}

struct Combined {
    a: A;
    b: B;
    c: C;
}

contract NestedCombineTest {
    val: Combined;

    init() {
        self.val = Combined{
            a: A{ x: 25, y: null },
            b: B{ s: "hello", o: 42 },
            c: C{ addr: myAddress(), coins: 100 }
        };
    }
}
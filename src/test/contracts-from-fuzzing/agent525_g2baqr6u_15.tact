struct A {
    x: Int?;
    y: String;
}

struct B {
    a: A;
    flag: Bool?;
    address: Address;
}

struct C {
    b: B;
    val: Int;
    comment: String?;
}

contract Test {
    f: C;

    init() {
        self.f = C{
            b: B{
                a: A{ x:null, y: "foo" },
                flag: true,
                address: myAddress()
            },
            val: 777,
            comment: null
        };
    }
}
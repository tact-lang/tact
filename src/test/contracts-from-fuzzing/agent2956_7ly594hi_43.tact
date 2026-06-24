struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    e: E;
}

struct E {
    val1: Int;
    val2: String;
    val3: Bool;
    val4: Int?;
    val5: String?;
    val6: Bool?;
}

contract NestChain {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            val1:42,
                            val2:"deepchain",
                            val3:true,
                            val4:null,
                            val5:null,
                            val6:null,
                        },
                    },
                },
            },
        };
    }
}

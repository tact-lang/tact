struct A1 {
    v: Int;
}

struct A2 {
    a1: A1;
}

struct A3 {
    a2: A2;
}

struct A4 {
    a3: A3;
}

struct A5 {
    a4: A4;
}

contract TestContract {
    receive() {
        let a: A5 = A5 {
            a4: A4 {
                a3: A3 {
                    a2: A2 {
                        a1: A1 { v: 777 }
                    }
                }
            }
        };
        dump(a.a4.a3.a2.a1.v);
    }
}

struct ManyNested {
    aa: A;
}

struct A {
    bb: B;
    cc: C;
}

struct B {
    dd: D;
}

struct C {
    val: Int;
}

struct D {
    flag: Bool;
}

contract DeepManyTest {
    data: ManyNested = ManyNested{
        aa: A{
            bb: B{ dd: D{ flag: true } }, 
            cc: C{ val: 42 }
        }
    };

    receive() {
        self.data = ManyNested{
            aa: A{
                bb: B{ dd: D{ flag: false } },
                cc: C{ val: 1 }
            }
        };
    }
}
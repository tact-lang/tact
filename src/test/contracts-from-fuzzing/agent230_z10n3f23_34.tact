struct ATest {
    x: Int;
}

struct BTest {
    a: ATest;
}

struct CTest {
    b: BTest;
}

struct DTest {
    c: CTest;
}

contract FourNest {
    field: DTest;

    init() {
        self.field = DTest {
            c: CTest{
                b: BTest{
                    a: ATest{ x: 42 }
                }
            }
        };
    }
}

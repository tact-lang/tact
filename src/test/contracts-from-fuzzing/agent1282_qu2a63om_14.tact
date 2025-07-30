struct MidA { m: Bool }
struct MidB { n: String }

struct TopTest {
    a: MidA;
    b: MidB;
    x: Int;
}

contract StructWithDifferentNestedTypes {
    val: TopTest;

    init() {
        self.val = TopTest{
            a: MidA{m:true},
            b: MidB{n:"x"},
            x: 42,
        };
    }
}

struct Inner1 { a: Int }
struct Inner2 { b: Int }
struct Middle {
    f1: Inner1;
    f2: Inner2;
}
struct Mixed {
    top1: Middle;
    top2: Middle;
}
contract DoubleMiddleTest {
    data: Mixed;

    init() {
        self.data = Mixed{
            top1: Middle{f1: Inner1{a:1}, f2: Inner2{b:2}},
            top2: Middle{f1: Inner1{a:3}, f2: Inner2{b:4}}
        };
    }
}
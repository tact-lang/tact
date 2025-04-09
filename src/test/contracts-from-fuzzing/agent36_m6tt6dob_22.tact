struct Inner1 { a: Int }
struct Inner2 { b: Bool }
struct Inner3 { c: String }
struct BigNest {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
}
contract StructsInside {
    b: BigNest;
    init() {
        self.b = BigNest{
            i1:Inner1{a:1},
            i2:Inner2{b:true},
            i3:Inner3{c:"x"}
        };
    }
}
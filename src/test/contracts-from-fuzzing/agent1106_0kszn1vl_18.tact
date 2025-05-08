struct BigNest1 {
    b1: Bool;
    i1: Int;
}
struct BigNest2 {
    b2: Bool;
    i2: Int;
    nested1: BigNest1;
}
struct BigNest3 {
    b3: Bool;
    i3: Int;
    nested2: BigNest2;
}

contract LargeDeepChain {
    val: BigNest3;

    init() {
        self.val = BigNest3{
            b3:true, i3:3,
            nested2: BigNest2{
                b2:true, i2:2,
                nested1: BigNest1{ b1:true, i1:1 }
            }
        };
    }
}
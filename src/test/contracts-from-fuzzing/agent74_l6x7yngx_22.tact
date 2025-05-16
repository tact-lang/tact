struct Inner1 { x: Int; }
struct Inner2 { y: Int; }

struct BigNested {
    i1: Inner1;
    i2: Inner2;
    i3: Inner1;
    i4: Inner2;
    i5: Inner1;
    i6: Inner2;
    i7: Inner1;
    i8: Inner2;
}

contract Test {
    val: BigNested;

    init() {
        self.val = BigNested{
            i1: Inner1{x:1}, i2:Inner2{y:2},
            i3: Inner1{x:3}, i4:Inner2{y:4},
            i5: Inner1{x:5}, i6:Inner2{y:6},
            i7: Inner1{x:7}, i8:Inner2{y:8}
        };
    }
}
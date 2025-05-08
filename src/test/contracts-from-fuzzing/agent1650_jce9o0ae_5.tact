struct Inner {
    x: Int;
}

struct Outer {
    i1: Inner;
    i2: Inner;
    i3: Inner;
    i4: Inner;
    i5: Inner;
    i6: Inner;
    i7: Inner;
    i8: Inner;
    i9: Inner;
    i10: Inner;
}

contract ManyNestedFields {
    big: Outer;

    init() {
        self.big = Outer{
            i1: Inner{x:1}, i2: Inner{x:2}, i3:Inner{x:3}, i4:Inner{x:4}, i5:Inner{x:5},
            i6: Inner{x:6}, i7: Inner{x:7}, i8:Inner{x:8}, i9:Inner{x:9}, i10:Inner{x:10}
        };
    }
}
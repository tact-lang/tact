struct LargeNested {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
}

struct OuterLarge {
    one: LargeNested;
    two: LargeNested;
}

contract TestContract {
    val: OuterLarge;

    init() {
        self.val = OuterLarge{
            one: LargeNested{f1:1,f2:2,f3:3,f4:4,f5:5},
            two: LargeNested{f1:6,f2:7,f3:8,f4:9,f5:10}
        };
    }
}
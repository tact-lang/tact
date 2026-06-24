struct InnerOnes {
    i1: Int;
    i2: Int;
    i3: Int;
}

struct OuterOnes {
    o1: InnerOnes;
    o2: InnerOnes;
}

contract TwoNestedStructs {
    data: OuterOnes;

    init() {
        self.data = OuterOnes{
            o1: InnerOnes{ i1:1, i2:2, i3:3 },
            o2: InnerOnes{ i1:4, i2:5, i3:6 }
        };
    }
}
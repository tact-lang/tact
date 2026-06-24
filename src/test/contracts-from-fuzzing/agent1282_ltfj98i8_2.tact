struct Inner {
    field1: Int;
    field2: Bool;
}

struct Middle {
    in1: Inner;
    in2: Inner;
}

struct Outer {
    mid1: Middle;
    mid2: Middle;
}

contract NestedFields {
    content: Outer;

    init() {
        self.content = Outer{
            mid1: Middle{
                in1: Inner{field1:1,field2:true},
                in2: Inner{field1:2,field2:false}
            },
            mid2: Middle{
                in1: Inner{field1:3,field2:true},
                in2: Inner{field1:4,field2:false}
            }
        };
    }
}
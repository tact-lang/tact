struct BigNested {
    inner1: Int;
    inner2: Bool;
    inner3: String;
}

struct VeryBig {
    field1: BigNested;
    field2: BigNested;
    field3: BigNested;
    field4: BigNested;
}

contract HugeNested {
    composite: VeryBig;

    init() {
        self.composite = VeryBig{
            field1: BigNested{ inner1:1, inner2:true, inner3:"x" },
            field2: BigNested{ inner1:2, inner2:false, inner3:"y" },
            field3: BigNested{ inner1:3, inner2:true, inner3:"z" },
            field4: BigNested{ inner1:4, inner2:false, inner3:"w" }
        };
    }
}
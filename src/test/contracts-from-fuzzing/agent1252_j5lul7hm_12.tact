struct LargeNested {
    s1: InnerLarge;
    s2: InnerLarge;
    s3: InnerLarge;
}

struct InnerLarge {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Slice;
}

contract LargeNestedContract {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            s1: InnerLarge{
                f1:1,f2:true,f3:"a",f4:myAddress(),f5:emptyCell().asSlice()
            },
            s2: InnerLarge{
                f1:2,f2:false,f3:"b",f4:myAddress(),f5:emptyCell().asSlice()
            },
            s3: InnerLarge{
                f1:3,f2:true,f3:"c",f4:myAddress(),f5:emptyCell().asSlice()
            }
        };
    }
}

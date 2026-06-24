struct BigNested {
    s1: Int;
    s2: String;
    s3: Address;
    s4: Cell;
    s5: Slice;
    s6: Bool;
    s7: Int?;
    s8: String?;
}

struct Holder {
    a: BigNested;
    b: BigNested;
    c: BigNested;
}

contract ManyBigNestings {
    h: Holder;

    init() {
        self.h = Holder{
            a: BigNested{ s1:1,s2:"",s3:myAddress(),s4:emptyCell(),s5:emptyCell().asSlice(),s6:true,s7:null,s8:null },
            b: BigNested{ s1:2,s2:"x",s3:myAddress(),s4:emptyCell(),s5:emptyCell().asSlice(),s6:false,s7:4,s8:null },
            c: BigNested{ s1:3,s2:"y",s3:myAddress(),s4:emptyCell(),s5:emptyCell().asSlice(),s6:true,s7:null,s8:"q" },
        };
    }
}
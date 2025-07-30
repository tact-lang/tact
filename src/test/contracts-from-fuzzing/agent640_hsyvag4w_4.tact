struct LargeTest {
    i1: Int;
    i2: Int;
    s1: String;
    s2: String;
    b1: Bool;
    b2: Bool?;
    addr1: Address;
    addr2: Address;
    c1: Cell;
    c2: Cell;
    sl1: Slice;
    sl2: Slice;
    str3: String;
    str4: String;
    flg: Bool?;
    optStr: String?;
    int3: Int?;
    int4: Int;
    bool3: Bool;
}

contract TestFuzz {
    state: LargeTest;

    init() {
        self.state = LargeTest{
            i1:1,i2:2,s1:"A",s2:"B",b1:true,b2:null,addr1:myAddress(),addr2:myAddress(),c1:emptyCell(),c2:emptyCell(),sl1:emptyCell().asSlice(),sl2:emptyCell().asSlice(),str3:"C",str4:"D",flg:true,optStr:null,int3:null,int4:5,bool3:false
        };
    }
}
struct BigNest {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Int?;
    val5: String?;
}

struct SuperBig {
    a: BigNest;
    b: BigNest;
    c: BigNest;
}

contract SBTest {
    x: SuperBig = SuperBig{
        a: BigNest{val1:1,val2:true,val3:"a",val4:null,val5:null},
        b: BigNest{val1:2,val2:false,val3:"b",val4:null,val5:null},
        c: BigNest{val1:3,val2:true,val3:"c",val4:null,val5:null},
    };
}
struct BigNested {
    s1: String;
    s2: String;
    s3: String;
    b1: Bool;
    b2: Bool;
    i1: Int;
    i2: Int;
    o1: Int?;
    o2: String?;
    o3: Bool?;
}

struct ContainsBig {
    big: BigNested;
}

contract TestContract {
    val: ContainsBig;

    init() {
        self.val = ContainsBig{ big: BigNested{
            s1:"a",s2:"b",s3:"c",b1:true,b2:false,i1:1,i2:2,o1:null,o2:null,o3:null
        } };
    }
}
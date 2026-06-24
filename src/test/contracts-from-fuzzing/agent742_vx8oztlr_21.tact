struct Mixed {
    i1: Int;
    s1: String;
    b1: Bool;
    i2: Int;
    s2: String;
    b2: Bool;
    i3: Int;
    s3: String;
    b3: Bool;
    i4: Int;
    s4: String;
}
contract TestContract {
    m: Mixed = Mixed{
        i1:1,s1:"a",b1:true,i2:2,s2:"b",b2:false,i3:3,s3:"c",b3:true,i4:4,s4:"d"
    };
    init() {}
}
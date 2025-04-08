struct LargeFlat {
    a1: Int;       a2: Bool;      a3: String;    a4: Address;    a5: Int?;
    a6: Int;       a7: Bool;      a8: String;    a9: Address;    a10: Int?;
    b1: Int;       b2: Bool;      b3: String;    b4: Address;    b5: Int?;
    b6: Int;       b7: Bool;      b8: String;    b9: Address;    b10: Int?;
    c1: Int;       c2: Bool;      c3: String;    c4: Address;    c5: Int?;
}

contract BulkTest {
    stuff: LargeFlat;

    init() {
        self.stuff = LargeFlat{
            a1:1,a2:true,a3:"x",a4:myAddress(),a5:null,
            a6:2,a7:false,a8:"y",a9:myAddress(),a10:null,
            b1:3,b2:true,b3:"z",b4:myAddress(),b5:null,
            b6:4,b7:false,b8:"w",b9:myAddress(),b10:null,
            c1:5,c2:true,c3:"v",c4:myAddress(),c5:null,
        };
    }
}
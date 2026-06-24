struct Large {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    a6: Int; a7: Int; a8: Int; a9: Int; a10: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
    addr1: Address; addr2: Address; addr3: Address; addr4: Address; addr5: Address;
    o1: Int?; o2: Bool?; o3: String?; o4: Address?; o5: Int?;
}

contract TestContract {
    large: Large;

    init() {
        self.large = Large{
            a1:1,a2:2,a3:3,a4:4,a5:5,
            a6:6,a7:7,a8:8,a9:9,a10:10,
            b1:true,b2:false,b3:true,b4:false,b5:true,
            s1:"1",s2:"2",s3:"3",s4:"4",s5:"5",
            addr1:myAddress(),addr2:myAddress(),addr3:myAddress(),addr4:myAddress(),addr5:myAddress(),
            o1:null,o2:null,o3:null,o4:null,o5:null
        };
    }
}

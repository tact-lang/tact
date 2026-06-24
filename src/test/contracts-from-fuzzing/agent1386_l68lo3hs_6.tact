struct Big {
    n1: Int;
    n2: Bool;
    n3: Bool?;
    n4: String;
    n5: String?;
    n6: Int;
    n7: Bool;
    n8: Bool?;
    n9: String;
    n10: String?;
    n11: Int;
    n12: Bool;
    n13: Bool?;
    n14: String;
    n15: String?;
    n16: Int;
    n17: Bool;
    n18: Bool?;
    n19: String;
    n20: String?;
}

contract Test {
    big: Big;

    init() {
        self.big = Big{
            n1:1,n2:true,n3:false,n4:"a",n5:null,n6:2,n7:true,n8:null,n9:"b",n10:null,
            n11:3,n12:false,n13:null,n14:"c",n15:"d",n16:4,n17:true,n18:false,n19:"e",n20:null
        };
    }
}
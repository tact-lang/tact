struct Bignest {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    opt1: Int?;
    opt2: Bool?;
    str: String;
    addr: Address;
}

contract ManyBigs {
    b1: Bignest;
    b2: Bignest;
    b3: Bignest;

    init() {
        self.b1 = Bignest{i1:1,i2:2,i3:3,i4:4,i5:5,opt1:null,opt2:true,str:"A",addr:myAddress()};
        self.b2 = Bignest{i1:6,i2:7,i3:8,i4:9,i5:10,opt1:0,opt2:null,str:"B",addr:myAddress()};
        self.b3 = Bignest{i1:11,i2:12,i3:13,i4:14,i5:15,opt1:1,opt2:false,str:"C",addr:myAddress()};
    }
}
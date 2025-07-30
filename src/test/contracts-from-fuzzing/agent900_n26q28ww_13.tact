struct BigStruct {
    f01: Int;
    f02: Bool?;
    f03: Int; 
    f04: Bool?;
    f05: Int; 
    f06: Bool?;
    f07: Int; 
    f08: Bool?;
    f09: Int; 
    f10: Bool?;
}

contract Test {
    big: BigStruct;

    init() {
        self.big = BigStruct {
            f01:1, f02:null, f03:3, f04:null, f05:5,
            f06:null, f07:7, f08:null, f09:9, f10:null
        };
    }

    receive() {
        self.big = BigStruct {
            f01:11, f02:true, f03:33, f04:false, f05:55,
            f06:true, f07:77, f08:false, f09:99, f10:true
        };
    }
}
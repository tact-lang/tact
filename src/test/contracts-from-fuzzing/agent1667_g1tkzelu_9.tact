struct Deep {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: String?;
}

contract Packed {
    d1: Deep;
    d2: Deep;
    d3: Deep;

    init() {
        self.d1 = Deep{ f1:1, f2:true, f3:"a", f4:null, f5:null };
        self.d2 = Deep{ f1:2, f2:false, f3:"b", f4:null, f5:null };
        self.d3 = Deep{ f1:3, f2:true, f3:"c", f4:null, f5:null };
    }
}

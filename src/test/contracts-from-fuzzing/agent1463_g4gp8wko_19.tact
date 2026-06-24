struct MultiLayer {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: String?;
}

contract MultiLevelStorage {
    rec1: MultiLayer;
    rec2: MultiLayer;
    rec3: MultiLayer;

    init() {
        self.rec1 = MultiLayer{f1:1, f2:true, f3:"a", f4:null};
        self.rec2 = MultiLayer{f1:2, f2:false, f3:"b", f4:null};
        self.rec3 = MultiLayer{f1:3, f2:true, f3:"c", f4:null};
    }
}

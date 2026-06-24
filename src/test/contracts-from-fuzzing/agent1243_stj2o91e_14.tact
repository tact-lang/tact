struct Deep {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
}

contract TestContract {
    d1: Deep;
    d2: Deep;

    init() {
        self.d1 = Deep{ f1:1, f2:true, f3:"a", f4:null, f5:null, f6:null };
        self.d2 = Deep{ f1:2, f2:false, f3:"b", f4:null, f5:null, f6:null };
    }

    receive() {
        dump(self.d1.f1);
    }
}
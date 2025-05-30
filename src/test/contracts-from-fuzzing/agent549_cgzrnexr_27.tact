struct BoolNest {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool?;
    b7: Bool?;
    b8: Bool?;
}

contract BoolStorage {
    val: BoolNest;

    init() {
        self.val = BoolNest{b1:true,b2:false,b3:true,b4:false,b5:true,b6:null,b7:null,b8:null};
    }

    receive() {
        self.val = BoolNest{b1:false,b2:true,b3:false,b4:true,b5:false,b6:true,b7:false,b8:true};
    }
}
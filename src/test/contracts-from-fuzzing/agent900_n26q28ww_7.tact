struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Int?;
    o4: Bool?;
    o5: Int?;
    o6: Bool?;
}

contract Test {
    optField: ManyOptionals;

    init() {
        self.optField = ManyOptionals {
            o1:null,o2:null,o3:null,o4:null,o5:null,o6:null
        };
    }

    receive() {
        self.optField = ManyOptionals {
            o1:1, o2:true, o3:3, o4:false, o5:5, o6:true
        };
    }
}
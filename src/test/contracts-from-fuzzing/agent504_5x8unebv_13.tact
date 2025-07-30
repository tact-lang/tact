struct ManyBooleans {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
}

contract BoolHeavy {
    data: ManyBooleans;

    init() {
        self.data = ManyBooleans{
            b1:true,b2:false,b3:true,b4:false,b5:true
        };
    }

    receive() {
        let d = self.data;
    }
}
struct MultiBool {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
}

contract MultiBoolFields {
    val: MultiBool = MultiBool{ b1:true, b2:false, b3:true, b4:false };

    init() {
        self.val = MultiBool{ b1:false, b2:true, b3:false, b4:true };
    }
}
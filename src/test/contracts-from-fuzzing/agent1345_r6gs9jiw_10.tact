struct ManyBoolOpt {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
    b5: Bool?;
}

contract BoolOptionalTest {
    storage: ManyBoolOpt;

    init() {
        self.storage = ManyBoolOpt{
            b1:true, b2:null, b3:false, b4:null, b5:true
        };
    }
}
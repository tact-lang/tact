// Struct with many nested optional booleans
struct OptBools {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
    b5: Bool?;
    b6: Bool?;
}

contract OptBoolsContract {
    s: OptBools;

    init() {
        self.s = OptBools{
            b1:true, b2:null, b3:false,
            b4:null, b5:true, b6:null
        };
    }
}
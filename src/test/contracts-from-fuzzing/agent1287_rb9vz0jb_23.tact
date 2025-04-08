// Struct with bools and optionals
struct OptsAndBools {
    f1: Bool;
    f2: Bool?;
    f3: Bool;
    f4: Bool?;
    f5: Bool;
    f6: Bool?;
}

contract TestContract {
    d: OptsAndBools;
    init() {
        self.d = OptsAndBools{
            f1:true, f2:null, f3:false, f4:null, f5:true, f6:null
        };
    }
}
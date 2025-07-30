contract LargeMix {
    int1: Int;
    bool1: Bool;
    optInt1: Int?;
    optBool1: Bool?;
    int2: Int;
    bool2: Bool;
    optInt2: Int?;
    optBool2: Bool?;
    int3: Int;
    bool3: Bool;
    optInt3: Int?;
    optBool3: Bool?;
    int4: Int;
    bool4: Bool;
    optInt4: Int?;
    optBool4: Bool?;
    int5: Int;
    bool5: Bool;
    optInt5: Int?;
    optBool5: Bool?;
    
    init() {
        self.int1=1; self.bool1=true; self.optInt1=null; self.optBool1=false;
        self.int2=2; self.bool2=false; self.optInt2=22; self.optBool2=null;
        self.int3=3; self.bool3=true; self.optInt3=33; self.optBool3=null;
        self.int4=4; self.bool4=false; self.optInt4=null; self.optBool4=true;
        self.int5=5; self.bool5=true; self.optInt5=55; self.optBool5=false;
    }
}
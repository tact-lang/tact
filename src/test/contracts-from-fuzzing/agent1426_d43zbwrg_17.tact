struct BoolNesting {
    b1: Bool; b2: Bool?; b3: Bool; b4: Bool?;
}

contract MixedBoolPersistence {
    vals: BoolNesting;

    init() {
        self.vals = BoolNesting{ b1:true, b2:null, b3:false, b4:true };
    }
}
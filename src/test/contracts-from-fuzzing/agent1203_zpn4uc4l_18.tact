struct Mix {
    i: Int;
    s: String;
    b: Bool;
    optI: Int?;
    optS: String?;
    optB: Bool?;
}

contract MixedOptionalDefault {
    data: Mix;
    
    init() {
        self.data = Mix{ i:1, s:"s", b:true, optI:null, optS:null, optB:null};
    }
}
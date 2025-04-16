struct ContainsBool {
    b1: Bool;
    b2: Bool;
    b3: Bool?;
    b4: Bool?;
}

contract ManyBools {
    c: ContainsBool;

    init() {
        self.c = ContainsBool{
            b1:true, b2:false, b3:null, b4:null
        };
    }
}
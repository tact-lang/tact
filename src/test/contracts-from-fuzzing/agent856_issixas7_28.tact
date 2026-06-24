struct BigDeep {
    x: Int;
    y: Int;
    z: Int;
    flag: Bool;
    txt: String;
}

contract ManyDeepFields {
    f1: BigDeep;
    f2: BigDeep;
    f3: BigDeep;

    init() {
        self.f1 = BigDeep{ x:1,y:2,z:3,flag:true,txt:"a" };
        self.f2 = BigDeep{ x:4,y:5,z:6,flag:false,txt:"b" };
        self.f3 = BigDeep{ x:7,y:8,z:9,flag:true,txt:"c" };
    }
}
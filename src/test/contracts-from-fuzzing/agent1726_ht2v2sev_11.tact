struct Contained {
    inner: Bool;
    flag: Bool;
}

contract ArraysOfStructs {
    x: Contained;
    y: Contained;
    z: Contained;
    init() {
        self.x = Contained{inner:true, flag:false};
        self.y = Contained{inner:false, flag:true};
        self.z = Contained{inner:true, flag:true};
    }
}
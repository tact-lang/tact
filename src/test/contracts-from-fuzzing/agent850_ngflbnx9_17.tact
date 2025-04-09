struct AB {
    a: Int;
    b: Int;
}

contract ListOfStructs {
    x: AB;
    y: AB;
    z: AB;

    init() {
        self.x = AB{a:1,b:2};
        self.y = AB{a:3,b:4};
        self.z = AB{a:5,b:6};
    }
}

struct Deep {
    x: Int;
    y: Bool?;
    z: Int?;
}

contract ArrayLike {
    vec1: Deep;
    vec2: Deep;
    vec3: Deep;

    init() {
        self.vec1 = Deep{x:1,y:true,z:3};
        self.vec2 = Deep{x:4,y:null,z:null};
        self.vec3 = Deep{x:7,y:false,z:8};
    }
}
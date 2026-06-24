struct ABC {
    a: Int;
    b: Bool;
    c: String;
}

contract MultipleStructs {
    x: ABC;
    y: ABC;
    z: ABC;

    init() {
        self.x = ABC{a:1,b:true,c:"x"};
        self.y = ABC{a:2,b:false,c:"y"};
        self.z = ABC{a:3,b:true,c:"z"};
    }
}
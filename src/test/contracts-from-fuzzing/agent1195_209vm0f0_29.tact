struct S { a: Int; b: Bool; c: String; }

contract MultiStructs {
    x: S;
    y: S;
    z: S;

    init() {
        self.x = S{a:1,b:true,c:"x"};
        self.y = S{a:2,b:false,c:"y"};
        self.z = S{a:3,b:true,c:"z"};
    }
}

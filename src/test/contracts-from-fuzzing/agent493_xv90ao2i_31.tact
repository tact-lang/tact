struct SingleLayer {
    a: Int;
    b: Bool;
    c: String;
}

contract MultiVar {
    v1: SingleLayer;
    v2: SingleLayer;
    v3: SingleLayer;

    init() {
        self.v1 = SingleLayer{a:1,b:true,c:"x"};
        self.v2 = SingleLayer{a:2,b:false,c:"y"};
        self.v3 = SingleLayer{a:3,b:true,c:"z"};
    }
}
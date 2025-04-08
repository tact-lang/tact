struct S {
  x: Int;
  y: String?;
  z: Bool;
}

contract ManyStructs {
    a: S;
    b: S;
    c: S;

    init() {
        self.a = S{x:1,y:null,z:true};
        self.b = S{x:2,y:"hi",z:false};
        self.c = S{x:3,y:null,z:true};
    }
}
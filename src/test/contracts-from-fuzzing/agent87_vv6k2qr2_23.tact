struct ManyOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
    a: Int?;
    b: Int?;
    c: Bool?;
}

contract OptFields {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            x:null,y:null,z:null,a:null,b:null,c:null
        };
    }
}

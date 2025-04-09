struct ManyOptionals {
    x: Int?;
    y: Int?;
    z: Int?;
    b: Bool?;
    s: String?;
}

contract SoManyOpts {
    bag: ManyOptionals;

    init() {
        self.bag = ManyOptionals{
            x:null, y:5, z:null, b:true, s:null
        };
    }
}

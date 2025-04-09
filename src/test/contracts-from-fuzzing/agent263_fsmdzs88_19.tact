struct Diverse {
    x: Int;
    y: Bool;
    z: String;
    a: Cell?;
    b: Slice?;
    c: Address?;
}

contract DiverseFields {
    d: Diverse;

    init() {
        self.d = Diverse{x:1,y:true,z:"z",a:null,b:null,c:null};
    }
}
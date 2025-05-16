struct ManyOptionals {
    x: Int?;
    y: Int?;
    z: Int?;
    b: Bool?;
    s: String?;
}

contract OnlyOptionalsNested {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            x:null,
            y:null,
            z:null,
            b:null,
            s:null
        };
    }
}

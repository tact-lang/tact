struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Bool?;
    o5: String?;
    o6: Bool?;
}

contract OptionalsFlood {
    d: ManyOptionals;

    init() {
        self.d = ManyOptionals{
            o1:null,o2:null,o3:null,o4:null,o5:null,o6:null
        };
    }
}

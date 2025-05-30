struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Int?;
    o5: Bool?;
}

contract OptionalFields {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            o1:null,o2:true,o3:null,o4:4,o5:null
        };
    }

    receive() {}
}
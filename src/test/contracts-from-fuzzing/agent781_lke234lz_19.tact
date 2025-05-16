struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Bool?;
    o5: String?;
    o6: String?;
    o7: Address?;
    o8: Address?;
}

contract OptionalsStructHolder {
    content: ManyOptionals;

    init() {
        self.content = ManyOptionals{
            o1:null,o2:null,o3:null,o4:null,
            o5:null,o6:null,o7:null,o8:null
        };
    }
}
struct OptionalsOnly {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
}

contract OnlyOptionals {
    data: OptionalsOnly;

    init() {
        self.data = OptionalsOnly{
            o1:null,
            o2:null,
            o3:null,
            o4:null
        };
    }
}
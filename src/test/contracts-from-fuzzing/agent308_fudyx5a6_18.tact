struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: String?;
}

contract MultipleOptionals {
    field: ManyOptionals;

    init() {
        self.field = ManyOptionals{
            o1:null,
            o2:5,
            o3:true,
            o4:"txt"
        };
    }
}

struct ManyOptionals {
    o1: Bool?;
    o2: Int?;
    o3: String?;
    o4: Bool?;
    o5: String?;
    o6: Int?;
    o7: String?;
    o8: Int?;
}

contract DenseNulls {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{
            o1:null,o2:null,o3:null,o4:null,o5:null,o6:null,o7:null,o8:null
        };
    }
}
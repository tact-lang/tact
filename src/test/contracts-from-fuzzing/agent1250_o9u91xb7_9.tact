struct ManyOptionals {
    o1: Int?; o2: Int?; o3: Bool?; o4: Bool?; o5: String?;
    o6: String?; o7: String?; o8: Int?; o9: Bool?; o10: String?;
}

contract OptionalStructPersist {
    state: ManyOptionals;

    init() {
        self.state = ManyOptionals{
            o1:null, o2:2, o3:true, o4:null, o5:"hi",
            o6:null, o7:"x", o8:null, o9:false, o10:null
        };
    }
}
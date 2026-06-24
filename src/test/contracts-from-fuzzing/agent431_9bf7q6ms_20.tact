struct OptionalMany {
    o1: Int?; o2: Int?; o3: Int?; o4: Bool?; o5: String?; o6: Bool?; o7: Int?; o8: String?; o9: Bool?;
}

contract BigOptionals {
    data: OptionalMany;

    init() {
        self.data = OptionalMany{
            o1:null, o2:null, o3:null, o4:null, o5:null, o6:null, o7:null, o8:null, o9:null
        };
    }
}

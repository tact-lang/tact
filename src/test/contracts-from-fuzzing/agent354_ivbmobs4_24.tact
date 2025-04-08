struct ManyOptionals {
    o1: Int?; o2: Int?; o3: Int?;
    o4: String?; o5: String?;
    o6: Bool?; o7: Bool?;
    o8: Address?; o9: Address?;
}

contract ManyOptionalsTest {
    vals: ManyOptionals;

    init() {
        self.vals = ManyOptionals{
            o1:null, o2:1, o3:null,
            o4:"hi", o5:null,
            o6:true, o7:null,
            o8:null, o9:myAddress()
        };
    }
}
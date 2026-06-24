struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Int?;
    o5: Bool?;
    o6: String?;
    o7: Int?;
    o8: Bool?;
    o9: String?;
}

contract ManyOptionalsTest {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            o1:null, o2:true, o3:null, o4:4, o5:false,
            o6:"hi", o7:7, o8:null, o9:"bye"
        };
    }
}
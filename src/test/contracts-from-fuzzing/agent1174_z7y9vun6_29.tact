struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Cell?;
    o5: Address?;
    o6: Slice?;
}

contract ManyOptionalsTest {
    data: ManyOptionals = ManyOptionals{
        o1:null, o2:null, o3:null, o4:null, o5:null, o6:null
    };
}
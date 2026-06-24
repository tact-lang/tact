struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Cell?;
    o5: Address?;
}

contract ManyOptionalFields {
    m: ManyOptionals;
    init() {
        self.m = ManyOptionals{
            o1:null, o2:true, o3:null, o4:null, o5:null
        };
    }
}
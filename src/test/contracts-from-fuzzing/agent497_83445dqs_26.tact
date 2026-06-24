struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Int?;
    o5: Bool?;
    o6: String?;
}

contract ManyOptionStruct {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            o1:null, o2:null, o3:null, o4:4, o5:true, o6:"s"
        };
    }
}
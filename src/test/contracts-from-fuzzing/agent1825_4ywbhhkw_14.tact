struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Int?;
    o6: Int?;
}

contract MassOptionals {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            o1:null, o2:1, o3:null, o4:4, o5:null, o6:6
        };
    }
}

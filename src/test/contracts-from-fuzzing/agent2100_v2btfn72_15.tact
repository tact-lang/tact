struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Int?;
    o6: Int?;
}

contract Test {
    options: ManyOptionals;
    init() {
        self.options = ManyOptionals{
            o1:null, o2:2, o3:null, o4:4, o5:5, o6:null
        };
    }
}
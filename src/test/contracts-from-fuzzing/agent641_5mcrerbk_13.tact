struct SequentialOptionals {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Int?;
    o6: Int?;
    o7: Int?;
}

contract TestContract {
    optchain: SequentialOptionals;

    init() {
        self.optchain = SequentialOptionals{
            o1:null, o2:1, o3:null, o4:42, o5:null, o6:99, o7:null
        };
    }
}
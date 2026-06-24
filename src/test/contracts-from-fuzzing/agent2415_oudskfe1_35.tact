struct ManyOptionals {
    o1:Int?;
    o2:Int?;
    o3:Int?;
    o4:Int?;
    o5:Int?;
}

contract LotsOfNull {
    m: ManyOptionals;

    init() {
        self.m=ManyOptionals{
            o1:null, o2:null, o3:null, o4:null, o5:null
        };
    }
}
struct BoolSeries {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool = false;
}

contract TestStorage {
    flags: BoolSeries;

    init() {
        self.flags = BoolSeries{
            flag1:true,flag2:false,flag3:true,flag4:false
        };
    }
}
struct Rec {
    int1: Int;
    flag1: Bool;

    int2: Int;
    flag2: Bool;

    int3: Int;
    flag3: Bool;

    int4: Int;
    flag4: Bool;

    int5: Int;
    flag5: Bool;

    int6: Int;
    flag6: Bool;
}

contract TestContract {
    data: Rec;

    init() {
        self.data = Rec{
            int1:1, flag1:true,
            int2:2, flag2:false,
            int3:3, flag3:true,
            int4:4, flag4:false,
            int5:5, flag5:true,
            int6:6, flag6:false
        };
    }
}

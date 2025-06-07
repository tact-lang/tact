struct PackedBools {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
}

contract ManyPackedBools {
    flags: PackedBools;

    init() {
        self.flags = PackedBools{
            flag1:true, flag2:false, flag3:true, flag4:false, flag5:true
        };
    }
}
struct MultipleBools {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
}

contract BoolEdge {
    e: MultipleBools;

    init() {
        self.e = MultipleBools{
            flag1:true, flag2:true, flag3:false, flag4:false, flag5:true
        };
    }
}
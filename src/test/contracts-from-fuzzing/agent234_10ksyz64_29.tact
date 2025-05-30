struct ManyOptionOpt {
    f1: Int?;
    f2: String?;
    f3: Bool?;
    f4: Address?;
    f5: Cell?;
    f6: Builder?;
    f7: Slice?;
}

contract ManyOptsContract {
    val: ManyOptionOpt;

    init() {
        self.val = ManyOptionOpt{
            f1:null, f2:null, f3:null, f4:null, f5:null, f6:null, f7:null
        };
    }
}
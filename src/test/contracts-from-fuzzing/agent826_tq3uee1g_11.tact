struct ManyOptionals {
    f1: Bool?;
    f2: Int?;
    f3: String?;
    f4: Bool?;
    f5: String?;
    f6: Int?;
}

contract ManyOptionalsContract {
    state: ManyOptionals;

    init() {
        self.state = ManyOptionals{
            f1:null, f2:null, f3:null, f4:true, f5:"hi", f6:999
        };
    }
}
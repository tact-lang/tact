struct ManyOpts {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
    opt5: Slice?;
    opt6: Cell?;
}

contract TestContract {
    m: ManyOpts;
    init() {
        self.m = ManyOpts{
            opt1:null,
            opt2:true,
            opt3:null,
            opt4:null,
            opt5:null,
            opt6:null
        };
    }
}
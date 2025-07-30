struct ManyNullable {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: Cell?;
    opt5: Slice?;
    opt6: String?;
    opt7: Int?;
    opt8: Bool?;
}

contract ManyStructOptionals {
    st: ManyNullable;
    init() {
        self.st = ManyNullable {
            opt1:null, opt2:null, opt3:null, opt4:null,
            opt5:null, opt6:null, opt7:null, opt8:null
        };
    }
}

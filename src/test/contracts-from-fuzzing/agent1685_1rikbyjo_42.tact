struct BigOpt {
    one: Int?;
    two: Bool?;
    three: Address?;
    four: String?;
    five: Cell?;
    six: Slice?;
}

contract ManyOpts {
    data: BigOpt;

    init() {
        self.data = BigOpt{
            one:null,two:null,three:null,four:null,five:null,six:null
        };
    }
}

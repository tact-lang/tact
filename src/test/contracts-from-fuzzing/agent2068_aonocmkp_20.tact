struct BigOpt {
    one: Int?;
    two: Int?;
    three: Int?;
    four: Int?;
    five: Int?;
    six: Int?;
    seven: Int?;
    eight: Int?;
    nine: Int?;
    ten: Int?;
}

contract OptionalBomb {
    val: BigOpt;

    init() {
        self.val = BigOpt{
            one:null,two:null,three:null,four:null,five:null,
            six:null,seven:null,eight:null,nine:null,ten:null
        };
    }
}
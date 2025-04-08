struct BigNested {
    one: Int;
    two: String;
    three: Bool?;
    four: Int?;
    five: String;
    six: Bool;
    seven: Int?;
    eight: Bool?;
}

contract MultiOptionalNested {
    val: BigNested;

    init() {
        self.val = BigNested{
            one:1,two:"str",three:true,four:null,five:"hi",
            six:false,seven:7,eight:null
        };
    }
}
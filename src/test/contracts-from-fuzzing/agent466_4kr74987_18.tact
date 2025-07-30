struct AggNested {
    one: Int;
    two: String;
    three: Bool;
    four: Int?;
    five: Bool?;
    six: String;
}

struct AggWrapper {
    inner1: AggNested;
    inner2: AggNested;
}

contract ManyStructsDeep {
    val: AggWrapper;

    init() {
        self.val = AggWrapper{
            inner1: AggNested{one:1,two:"two",three:true,four:null,five:null,six:"six"},
            inner2: AggNested{one:11,two:"22",three:false,four:null,five:null,six:"66"}
        };
    }
}
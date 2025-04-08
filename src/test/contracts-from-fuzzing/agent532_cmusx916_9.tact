struct MixedStruct {
    one: Int;
    two: Bool;
    three: Int?;
    four: Bool?;
    five: Int;
    six: Bool;
    seven: String;
    eight: String?;
}

contract Mixed {
    data: MixedStruct;

    init() {
        self.data = MixedStruct{
            one:1,two:true,three:null,four:false,five:42,six:true,seven:"test",eight:null
        };
    }
}
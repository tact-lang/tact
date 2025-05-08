struct ManyOptional {
    one: Int?;
    two: Int?;
    three: Int?;
    four: Int?;
    five: Int?;
    six: Int?;
    seven: Int?;
    eight: Int?;
    nine: Bool?;
    ten: Bool?;
}

contract TestContract {
    dataStore: ManyOptional;

    init() {
        self.dataStore = ManyOptional{
            one:null,two:2,three:null,four:4,five:null,six:6,seven:null,eight:8,nine:true,ten:null
        };
    }
}
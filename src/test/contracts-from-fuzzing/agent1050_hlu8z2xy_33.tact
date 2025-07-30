struct ComplexDeep {
    one: Int;
    two: Bool;
    three: String;
    four: Int?;
    five: Bool?;
    six: String?;
    seven: Int;
    eight: Bool;
    nine: String;
}

contract ComplexStateVars {
    s: ComplexDeep;

    init() {
        self.s = ComplexDeep{
            one:1, two:true, three:"3", four:null, five:false, six:null, seven:7, eight:true, nine:"9"
        };
    }
}

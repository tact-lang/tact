struct SuperDeep {
    one: Int;
    two: String;
    three: Bool;
    four: Int?;
    five: String?;
    six: Bool?;
    seven: Int;
    eight: String;
    nine: Bool;
    ten: Int?;
}

contract PackedFields {
    stuff: SuperDeep;

    init() {
        self.stuff = SuperDeep{
            one:1, two:"", three:true, four:null, five:null, six:null, seven:7, eight:"", nine:false, ten:null
        };
    }
}

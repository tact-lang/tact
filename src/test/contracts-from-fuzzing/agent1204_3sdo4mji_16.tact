struct Layer {
    first: Int;
    opt1: Int?;
    second: String;
    opt2: String?;
    third: Bool;
    opt3: Bool?;
}

contract MixedOptional {
    rec: Layer;

    init() {
        self.rec = Layer{
            first:1,
            opt1:null,
            second:"a",
            opt2:null,
            third:true,
            opt3: null
        };
    }
}

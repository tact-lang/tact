struct Comp {
    one: Int;
    two: Bool?;
    three: String;
    four: Address?;
    five: Int?;
    six: String?;
    seven: Bool;
}

contract MixStore {
    c: Comp = Comp{
        one:1, two:null, three:"t3", four:null, five:null, six:null, seven:true
    };
}
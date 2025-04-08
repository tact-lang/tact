struct MixOptionalAndRequired {
    req1: Int;
    opt1: Int?;
    req2: Bool;
    opt2: String?;
    req3: Cell;
    opt3: Cell?;
}

contract MixedContract {
    s: MixOptionalAndRequired;

    init() {
        self.s = MixOptionalAndRequired{
            req1:1,
            opt1:null,
            req2:true,
            opt2:null,
            req3:emptyCell(),
            opt3:null,
        };
    }
}
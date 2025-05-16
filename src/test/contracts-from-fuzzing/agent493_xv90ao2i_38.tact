struct Mix {
    i: Int;
    s: String;
    b: Bool;
    si: String?;
    bi: Bool?;
    ii: Int?;
    ai: Address?;
}

contract VariousOptionals {
    v: Mix;

    init() {
        self.v = Mix{
            i:1,
            s:"s",
            b:true,
            si:null,
            bi:null,
            ii:null,
            ai:null
        };
    }
}
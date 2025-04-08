struct Immix {
    x: Int?;
    y: Int;
    flag: Bool;
    str: String?;
}

contract MixedOptions {
    dat: Immix;
    b: Bool?;

    init() {
        self.dat = Immix{
            x:null,
            y:5,
            flag:true,
            str:null
        };
        self.b = null;
    }
}
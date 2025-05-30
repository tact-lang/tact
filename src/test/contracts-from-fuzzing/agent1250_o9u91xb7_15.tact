struct Mix {
    i: Int;
    b: Bool;
    s: String;
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract DefaultsMix {
    data: Mix;

    init() {
        self.data = Mix{
            i:1, b:true, s:"s",
            oi:null, ob:false, os:null
        };
    }
}
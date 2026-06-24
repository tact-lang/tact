struct Mix {
    b: Bool;
    i: Int;
    s: String;
    bo: Bool?;
    io: Int?;
    so: String?;
}

contract MixFields {
    f: Mix;

    init() {
        self.f = Mix{ b:true,i:1,s:"x",bo:null,io:null,so:null };
    }
}
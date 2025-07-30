struct Mix {
    i: Int;
    bi: Bool;
    s: String;
    io: Int?;
    so: String?;
    bo: Bool?;
}

contract MixTest {
    data: Mix;

    init() {
        self.data = Mix{
            i:1, bi:true, s:"hi", io:null, so:null, bo:null
        };
    }
}

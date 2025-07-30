struct Mix {
    a: Int as uint8;
    b: Int as int16;
    c: Bool;
    d: String?;
    e: Address;
}

contract MixedFormats {
    f: Mix;

    init() {
        self.f = Mix{
            a:255, b:-1234, c:true, d:null, e: myAddress()
        };
    }
}
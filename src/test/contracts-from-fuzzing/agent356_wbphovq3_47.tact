struct SI {
    a: Int?;
    b: Int;
    c: Bool?;
}

contract MixedOptionals {
    si: SI;

    init() {
        self.si = SI{ a:null, b:42, c:null };
    }
}
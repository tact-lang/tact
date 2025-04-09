struct Composite {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    p: Bool?;
    q: String?;
}

contract MixedOptionals {
    d: Composite;
    
    init() {
        self.d = Composite{
            i: 7,
            b: false,
            s: "xx",
            o: null,
            p: true,
            q: null
        };
    }
}
struct IntsAndBools {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
}

contract MixFields {
    s: IntsAndBools;

    init() {
        self.s = IntsAndBools{
            a:1,
            b:true,
            c:2,
            d:false,
            e:3,
        };
    }
}
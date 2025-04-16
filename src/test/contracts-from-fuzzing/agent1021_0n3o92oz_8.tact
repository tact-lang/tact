struct DefaultMix {
    a: Int = 1;
    b: Bool;
    c: String = "hello";
    d: Int;
    e: Bool = false;
    f: String;
}

contract MixedDefaults {
    data: DefaultMix;

    init() {
        self.data = DefaultMix{
            b:true, d:42, f:"world"
        };
    }
}
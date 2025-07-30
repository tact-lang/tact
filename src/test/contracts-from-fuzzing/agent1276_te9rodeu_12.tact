struct Mixed {
    a: Int;
    b: String;
    c: Int?;
    d: Bool?;
    e: String;
    f: Bool;
}

contract OptionalFieldMix {
    value: Mixed;

    init() {
        self.value = Mixed{
            a:1, b:"two", c:null, d:null, e:"five", f:true
        };
    }
}
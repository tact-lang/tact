struct Multi {
    one: Int;
    two: Int;
    three: Int;
}

contract ManyFields {
    a: Multi;
    b: Multi;
    c: Multi;
    init() {
        self.a=Multi{one:1,two:2,three:3};
        self.b=Multi{one:4,two:5,three:6};
        self.c=Multi{one:7,two:8,three:9};
    }
}
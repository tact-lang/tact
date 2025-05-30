struct DeepMany {
    one: Int;
    two: Int;
    three: Int;
}

contract DeepManyFields {
    d1: DeepMany;
    d2: DeepMany;
    d3: DeepMany;

    init() {
        self.d1 = DeepMany{one:1,two:2,three:3};
        self.d2 = DeepMany{one:4,two:5,three:6};
        self.d3 = DeepMany{one:7,two:8,three:9};
    }
}
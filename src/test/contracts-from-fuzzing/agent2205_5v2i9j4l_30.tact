struct Tuple {
    one: Int;
    two: Int;
    three: Int;
}

contract MultipleStructs {
    a: Tuple;
    b: Tuple;

    init() {
        self.a = Tuple{one:1,two:2,three:3};
        self.b = Tuple{one:4,two:5,three:6};
    }
}
struct Flattened {
    x: Int;
    y: Int;
}

contract FlattenedNestedFields {
    a: Flattened;
    b: Flattened;
    c: Flattened;
    d: Flattened;

    init() {
        self.a = Flattened{x:1,y:2};
        self.b = Flattened{x:3,y:4};
        self.c = Flattened{x:5,y:6};
        self.d = Flattened{x:7,y:8};
    }
}
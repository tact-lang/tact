struct Nested {
    a: Int;
    b: Int?;
}

contract Test {
    x: Nested;
    y: Nested;

    init() {
        self.x = Nested{a:1,b:null};
        self.y = Nested{a:2,b:3};
    }
}
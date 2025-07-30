struct Nested {
    a: Int;
    b: Int?;
    c: Int;
}

contract SerializeOrder {
    x: Nested;

    init() {
        self.x = Nested{a:1,b:null,c:3};
    }
}

struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract DiffOrders {
    x: Nested;
    y: Int;
    z: Bool;

    init() {
        self.x = Nested{a:1,b:true,c:"hi"};
        self.y = 100;
        self.z = false;
    }
}

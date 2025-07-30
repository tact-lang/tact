struct Nested {
    x: Int;
    y: Bool;
    z: Address;
}

contract WithNested {
    coord: Nested;

    init() {
        self.coord = Nested{ x: 17, y: false, z: myAddress() };
    }
}
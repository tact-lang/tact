struct Nested {
    x: Int;
    y: Bool;
    z: Address;
    s: String;
}

contract HasNested {
    item: Nested;

    init() {
        self.item = Nested{
            x: 42,
            y: true,
            z: myAddress(),
            s: "hi"
        };
    }
}
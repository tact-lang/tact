struct Composite {
    x: Int;
    y: Bool;
    z: String;
}

contract MultipleStructs {
    first: Composite;
    second: Composite;

    init() {
        self.first = Composite{ x: 5, y: true, z: "one" };
        self.second = Composite{ x: 7, y: false, z: "two" };
    }
}
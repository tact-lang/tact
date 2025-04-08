struct DefaultsX {
    x: Int = 11;
    y: Bool = false;
    z: String = "foo";
}

contract PartialDefaultAssign {
    s: DefaultsX;

    init() {
        self.s = DefaultsX{
            y: true
        };
    }
}
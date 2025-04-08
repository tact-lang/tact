struct MultiOption {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract ManyOptionals {
    f: MultiOption;

    init() {
        self.f = MultiOption{x: null, y: null, z: null};
    }
}
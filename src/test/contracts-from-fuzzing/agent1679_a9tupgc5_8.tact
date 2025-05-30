struct MultiOption {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract StructOfOptionals {
    m: MultiOption;

    init() {
        self.m = MultiOption{ x: null, y: null, z: null };
    }

    receive() {}
}
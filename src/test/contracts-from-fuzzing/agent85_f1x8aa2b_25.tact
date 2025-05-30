struct MultipleOptionals {
    x: Int?;
    y: Int?;
    z: Bool?;
}

contract MultipleNulls {
    m: MultipleOptionals;

    init() {
        self.m = MultipleOptionals{
            x: null,
            y: null,
            z: null
        };
    }

    receive() {}
}
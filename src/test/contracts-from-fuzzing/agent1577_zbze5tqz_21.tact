struct NarrowTypes {
    a: Int as uint4;
    b: Int as int8;
    c: Int?;
    d: Int as uint16;
    e: Int?; // Without serialization spec
}

contract TestContract {
    data: NarrowTypes;
    init() {
        self.data = NarrowTypes{
            a: 8,
            b: -5,
            c: null,
            d: 255,
            e: null
        };
    }
}
struct Mixed {
    flag: Bool;
    count: Int as uint8;
    price: Int as coins;
    description: String;
    hash: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    optionalInt: Int?;
    optionalFlag: Bool?;
    nested: Nested;
}

struct Nested {
    id: Int;
}

contract MixedTypes {
    storage: Mixed;

    init() {
        self.storage = Mixed{
            flag: true,
            count: 255,
            price: 1000000000,
            description: "desc",
            hash: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            optionalInt: null,
            optionalFlag: true,
            nested: Nested{id: 42}
        };
    }
}
struct Sub1 {
    x: Int?;
    y: Bool?;
}

struct Sub2 {
    s: String?;
    z: Int;
}

struct RootStruct {
    first: Sub1;
    second: Sub2;
    note: String;
}

contract NestedStructs {
    storage: RootStruct;

    init() {
        self.storage = RootStruct{
            first: Sub1{ x: null, y: true },
            second: Sub2{ s: null, z: 1234 },
            note: "init",
        };
    }
}
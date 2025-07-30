struct DeepOptionStruct {
    x: Int;
    y: Bool;
    z: String?;
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionDeep {
    data: DeepOptionStruct;

    init() {
        self.data = DeepOptionStruct{
            x: 5,
            y: true,
            z: null,
            a: null,
            b: true,
            c: "opt"
        };
    }
}
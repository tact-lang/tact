struct ManyTypes {
    x: Int;
    y: Bool;
    z: Address;
    s: String;
    optX: Int?;
    optY: Bool?;
    optZ: Address?;
}

contract MultiFieldTypes {
    info: ManyTypes;

    init() {
        self.info = ManyTypes{
            x: 1,
            y: true,
            z: myAddress(),
            s: "hello",
            optX: null,
            optY: null,
            optZ: null
        };
    }
}
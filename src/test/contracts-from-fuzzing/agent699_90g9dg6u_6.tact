struct DeepOptional {
 a: Int?; b: Bool?; c: String?; d: Int?; e: Bool?; f: String?;
}

contract OptionalStorage {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            a: null, b: true, c: "str", d: 5, e: null, f: null
        };
    }
}
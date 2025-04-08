struct DeepStruct { a: Int; b: Bool; c: String; d: Int?; e: Bool?; }

contract AllTypesDefault {
    s: DeepStruct = DeepStruct{
        a: 12,
        b: true,
        c: "xyz",
        d: null,
        e: false
    };

    init() {
        self.s = DeepStruct{
            a: 99,
            b: false,
            c: "abc",
            d: 50,
            e: null
        };
    }
}
struct S {
    int1: Int;
    int2: Int as uint8;
    int3: Int as int4;
    int4: Int as uint256;
    flag: Bool;
    text: String;
    optInt: Int?;
}

contract SerializationTest {
    data: S;

    init() {
        self.data = S{
            int1: 1,
            int2: 255,
            int3: 7,
            int4: 123456789,
            flag: true,
            text: "serialize",
            optInt: null
        };
    }
}
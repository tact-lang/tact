struct Flat {
    x: Int;
    y: Int;
    z: Int;
    flag: Bool;
    text: String;
    optInt: Int?;
    optStr: String?;
    flag2: Bool;
    str2: String;
    int2: Int;
}

contract WideTest {
    data: Flat;

    init() {
        self.data = Flat{
            x: 1,
            y: 2,
            z: 3,
            flag: true,
            text: "abc",
            optInt: null,
            optStr: null,
            flag2: false,
            str2: "def",
            int2: 4
        };
    }
}
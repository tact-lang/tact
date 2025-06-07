struct OptionalLayer {
    s: String?;
    flag: Bool?;
    num: Int?;
}

contract OptStructTest {
    data: OptionalLayer = OptionalLayer{
        s: null,
        flag: null,
        num: null,
    };

    init() {}
}
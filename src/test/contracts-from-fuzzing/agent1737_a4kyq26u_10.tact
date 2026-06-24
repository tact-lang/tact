struct Combo {
    a: Int = 32;
    b: Int?;
    c: String = "hello";
    d: String? = null;
    e: Bool;
    f: Bool? = null;
    g: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    h: Address?;
}

contract ComboTest {
    combo: Combo = Combo{
        b: null,
        e: false,
        h: null
    };
}
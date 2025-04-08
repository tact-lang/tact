struct SE {
    num: Int as uint64;
    flag: Bool;
}
struct SC {
    f: SE;
    val: Int as int16;
}

contract DeepSerTest {
    d: SC = SC{
        f: SE{ num: 777, flag: true },
        val: -12
    };
    init() {}
}
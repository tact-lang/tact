struct Data {
    Opt: Int?;
    Dict: map<Int, Int>;
}

fun testOptionalMap(): Int {
    let d = Data {
        Opt: 55,
        Dict: emptyMap()
    };
    d.Dict.set(1, 100);
    return (d.Opt)!! + (d.Dict.get(1))!!;
}

contract TestOptionalMap {
    receive() {
        testOptionalMap();
    }
}

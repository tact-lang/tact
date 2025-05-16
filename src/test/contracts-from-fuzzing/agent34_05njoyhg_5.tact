contract DummyContract {
    init() {}
}

fun main() : Int {
    let s : StateInit = initOf DummyContract();
    let addr1 : Address = contractAddress(s);
    let h : Int = contractHash(s.code, s.data);
    let addr2 : Address = newAddress(0, h);
    return (addr1.toString() == addr2.toString()) ? 1 : 0;
}

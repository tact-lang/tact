struct CompOpt {
    s: String?;
    addr: Address?;
    c: Cell?;
    sl: Slice?;
}

contract TestContract {
    co: CompOpt = CompOpt{
        s: null,
        addr: null,
        c: null,
        sl: null
    };

    receive() {}
}
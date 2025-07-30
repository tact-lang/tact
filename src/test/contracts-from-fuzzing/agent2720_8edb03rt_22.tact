struct AddrHolder {
    addr: Address?;
}

contract Test {
    holder: AddrHolder = AddrHolder{ addr: null };
}
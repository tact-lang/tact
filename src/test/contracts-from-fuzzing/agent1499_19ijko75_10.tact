struct DiverseLiteralDefaults {
    intf: Int = 5;
    boolf: Bool = true;
    addrf: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    strf: String = "hi";
    cellf: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");
    slicef: Slice = slice("te6cckEBAQEAAgAAAEysuc0=");
}

contract DiverseDefaults {
    data: DiverseLiteralDefaults = DiverseLiteralDefaults{};
}

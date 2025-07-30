struct OptionalTogether {
    intVal: Int?;
    boolVal: Bool?;
    addrVal: Address?;
    cellVal: Cell?;
    sliceVal: Slice?;
}

contract OptionalMix {
    mix: OptionalTogether;

    init() {
        self.mix = OptionalTogether{
            intVal: null,
            boolVal: null,
            addrVal: null,
            cellVal: null,
            sliceVal: null
        };
    }
}
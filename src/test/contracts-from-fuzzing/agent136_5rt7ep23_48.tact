struct OptionalUint32 {
    v: Int? as uint32;
}

contract TestOptionalUint32 {
    f: OptionalUint32;

    init() {
        self.f = OptionalUint32{ v: null };
    }
}
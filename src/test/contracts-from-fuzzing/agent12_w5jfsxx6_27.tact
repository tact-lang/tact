struct MixedNested {
    s: String;
    so: String?;
    io: Int?;
}

contract StructMixField {
    m: MixedNested = MixedNested{ s: "x", so: null, io: null };
}
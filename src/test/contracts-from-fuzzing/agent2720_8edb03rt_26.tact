struct SerOpt {
    small: Int as uint4;
    maybe: Int?;        // optional, no serialization annotation
    tiny: Int as int8;
}

contract Test {
    so: SerOpt = SerOpt{ small: 1, maybe: null, tiny: -8 };
}
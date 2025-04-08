struct SOptional {
    val: Int?;
}

contract StructDefaultNullOptional {
    s: SOptional;

    init() {
        self.s = SOptional{ val: null };
    }
}
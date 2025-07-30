struct SOptional {
    oi: Int?;
}

contract StructWithOptDefault {
    s: SOptional = SOptional{oi:null};

    init() {
        self.s = SOptional{oi:null};
    }
}
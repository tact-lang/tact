struct SingleDefault {
    a: Int = 42;
    b: Int;
}

contract StructDefaultPartially {
    sd: SingleDefault;

    init() {
        self.sd = SingleDefault{
            b: 99
        };
    }
}

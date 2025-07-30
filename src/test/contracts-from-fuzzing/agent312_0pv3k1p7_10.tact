struct PrimitiveOptionals {
    sa: Int?;
    sb: Bool?;
    sc: Address?;
    sd: Cell?;
    se: String?;
    sf: Slice?;
}

contract ContainerOpt {
    nestedOpt: PrimitiveOptionals;

    init() {
        self.nestedOpt = PrimitiveOptionals{
            sa: null,
            sb: null,
            sc: null,
            sd: null,
            se: null,
            sf: null,
        };
    }
}
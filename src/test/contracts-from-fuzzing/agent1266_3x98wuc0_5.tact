contract OnlyOptionals {
    intOpt: Int? = null;
    boolOpt: Bool? = null;
    stringOpt: String? = null;
    cellOpt: Cell? = null;
    sliceOpt: Slice? = null;
    builderOpt: Builder? = null;
    addressOpt: Address? = null;

    init() {
        self.intOpt = null;
    }
}
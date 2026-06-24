struct OptEmbedded {
    val: Int?;
}

contract OptionalSimple {
    o: OptEmbedded;

    init() {
        self.o = OptEmbedded{val: null};
    }
}
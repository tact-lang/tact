struct MinWidth {
    tiny: Int as int1;
    unit: Int as uint1;
}

contract MinWidthPersist {
    s: MinWidth;

    init() {
        self.s = MinWidth{
            tiny: 1,
            unit: 1,
        };
    }
}

struct InnerVar {
    z: Int;
}

contract DefaultNested {
    nested: InnerVar = InnerVar{z: 10};

    init() {
        self.nested = InnerVar{z: 42};
    }
}

struct OptAs {
    foo: Int? as uint8;
}

contract OptionalAsStruct {
    data: OptAs;

    init() {
        self.data = OptAs{foo: null};
    }
}

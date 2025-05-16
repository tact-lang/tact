struct S {
    i: Int as int8;
    j: Int? as uint32;
}

contract OptSerializeCombo {

    data: S?;

    init() {
        self.data = null;
    }
}
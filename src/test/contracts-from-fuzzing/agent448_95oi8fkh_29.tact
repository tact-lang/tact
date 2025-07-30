struct OptionalSerializeOverflow {
    tiny: Int? as uint4;
}

contract OptionalSerializeOverflowContract {
    data: OptionalSerializeOverflow;

    init() {
        self.data = OptionalSerializeOverflow{
            tiny: 42,
        };
    }

    receive() {}
}
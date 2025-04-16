struct WithOptionalInt {
    a: Int?;
}

contract OptionalAssignedLater {
    data: WithOptionalInt;

    init() {
        self.data = WithOptionalInt{a: null};
    }

    receive() {
        self.data = WithOptionalInt{a: 5};
    }
}
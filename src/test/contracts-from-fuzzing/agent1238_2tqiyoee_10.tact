struct OptionalInStruct {
    o: Int?;
}

contract FieldReassignmentTest {
    f: OptionalInStruct;

    init() {
        self.f = OptionalInStruct{ o: 1 };
        self.f = OptionalInStruct{ o: null };
    }
}
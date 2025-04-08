struct SubStruct {
    foo: Int;
}

contract OptionalFieldPersistence {
    s: SubStruct?;

    receive() {
        self.s = null;
    }
}
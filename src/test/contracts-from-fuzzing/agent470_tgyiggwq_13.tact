struct OptStruct {
    val: Int;
    opt: Bool?;
}

contract OptField {
    o: OptStruct?;

    init() {
        self.o = null;
    }
}
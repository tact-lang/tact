struct ChildStruct {
    p: Int;
    q: Bool;
}

contract OptionalStructPersistence {
    s1: ChildStruct?;
    s2: ChildStruct?;

    init() {
        self.s1 = null;
        self.s2 = ChildStruct{ p: 3, q:true };
    }
}
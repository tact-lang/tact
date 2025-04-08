struct NestedWithSerialization {
    intVal: Int as uint32;
    intValOpt: Int?;
    boolVal: Bool;
    boolValOpt: Bool?;
}

contract TestContract(nw: NestedWithSerialization) {
    receive() {
        let _ = self.nw;
    }
}
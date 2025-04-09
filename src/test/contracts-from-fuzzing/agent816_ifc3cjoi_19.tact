struct SNest {
    nested: Int;
}

contract PersistOptStruct {
    opt: SNest?;

    init() {
        self.opt = SNest { nested: 888 };
    }
}
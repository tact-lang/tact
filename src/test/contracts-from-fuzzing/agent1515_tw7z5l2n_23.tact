struct NullDef {
    x: Int? = null;
}

contract PersistNullDef {
    data: NullDef;

    init() {
        self.data = NullDef{};
    }

    receive() { dump(0); }
}
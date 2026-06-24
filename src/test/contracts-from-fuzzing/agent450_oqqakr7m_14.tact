struct DefStruct {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Bool = true;
    e: Bool = false;
    f: String = "x";
    g: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
}

contract DefStore {
    val: DefStruct;
    init() {
        self.val = DefStruct{};
    }
}
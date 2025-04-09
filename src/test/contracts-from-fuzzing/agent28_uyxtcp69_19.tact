struct DefStruct {
    a: Int = 1;
    b: Bool? = null;
    c: Int = 5;
    d: String = "ok";
    e: Bool? = false;
}

contract DefStore {
    data: DefStruct;

    init() {
        self.data = DefStruct{ };
    }
}
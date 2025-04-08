contract SerializationHints {
    intVal: Int as int64;
    uintVal: Int as uint64;
    coinVal: Int as coins;
    flag: Bool;
    txt: String;

    init() {
        self.intVal = -44444;
        self.uintVal = 55555;
        self.coinVal = ton("1.5");
        self.flag = true;
        self.txt = "Serialization test";
    }
}
struct EdgeSerialize {
    optStr: String?;
    bigInt: Int;
    flag: Bool;
}

contract EdgeSerializePersist {
    dat: EdgeSerialize;
    init() {
        self.dat = EdgeSerialize{ optStr: null, bigInt: 123456789, flag: true };
    }
}
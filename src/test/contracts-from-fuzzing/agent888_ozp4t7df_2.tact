struct BigOne {
    val1: Int;
    val2: String;
    val3: Bool;
    val4: Int;
    val5: String;
    val6: Bool;
    val7: Int?;
    val8: String;
    val9: Bool?;
    val10: Int;
    val11: String?;
    val12: Bool;
    val13: Int;
    val14: String;
    val15: Bool;
    val16: Int?;
    val17: String;
    val18: Bool?;
    val19: Int;
    val20: String;
}

contract Test {
    storage: BigOne;

    init() {
        self.storage = BigOne{
            val1: 1, val2: "a", val3: true, val4: 2, val5: "b",
            val6: false, val7: null, val8: "c", val9: null, val10: 3,
            val11: null, val12: true, val13: 4, val14: "d", val15: false,
            val16: null, val17: "e", val18: null, val19: 5, val20: "f",
        };
    }
}
struct BigStruct {
    a0: Int; a1: Int?; a2: Bool; a3: Bool?; a4: String;
    a5: String?; a6: Address; a7: Address?; a8: Int;
    a9: Int?; a10: Bool; a11: Bool?; a12: String;
    a13: String?; a14: Address; a15: Address?; a16: Int;
    a17: Int?; a18: Bool; a19: Bool?; a20: String?;
}

contract BigStructStorage {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a0: 0, a1: null, a2: true, a3: null, a4: "a",
            a5: null, a6: myAddress(), a7: null, a8: 8,
            a9: 9, a10: false, a11: true, a12: "b",
            a13: null, a14: myAddress(), a15: null, a16: 16,
            a17: 17, a18: true, a19: false, a20: "final"
        };
    }
}
struct SOpt {
    o: Bool?;
    n: Int?;
    s: String?;
}

contract AllOptStruct {
    val: SOpt;
    init() {
        self.val = SOpt{ o: null, n: null, s: null };
    }
}
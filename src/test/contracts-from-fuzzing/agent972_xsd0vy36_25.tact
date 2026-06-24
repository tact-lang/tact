struct OptRecord {
    k: String?;
    v: Int?;
}

contract SingleOptStruct {
    rec: OptRecord;

    init() {
        self.rec = OptRecord{ k: null, v: null };
    }
}
struct LongRecord {
    a: Int; b: Int; c: Bool; d: String; e: Bool;
    f: Int; g: String; h: Bool; i: Int; j: String;
}

contract WideFields {
    record: LongRecord;

    init() {
        self.record = LongRecord{
            a:1, b:2, c:true, d:"d", e:false,
            f:3, g:"g", h:true, i:4, j:"j"
        };
    }
}
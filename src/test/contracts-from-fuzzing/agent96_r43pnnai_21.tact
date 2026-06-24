struct InnerSeq {
    val1: Int;
    val2: Int;
    val3: Int;
    val4: Int;
}

contract SequentialStructFields {
    seq: InnerSeq;

    init() {
        self.seq = InnerSeq{
            val1: 1,
            val2: 2,
            val3: 3,
            val4: 4
        };
    }
}
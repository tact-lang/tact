struct Shard {
    huge1: Int;
    huge2: Int;
    huge3: Int;
    huge4: Int;
    huge5: Int;
    huge6: Int;
    huge7: Int;
    huge8: Int;
    huge9: Int;
    huge10: Int;
    huge11: Int;
    huge12: Int;
    huge13: Int;
    huge14: Int;
    huge15: Int;
    huge16: Int;
}

contract BigShardContract {
    shard: Shard;

    init() {
        self.shard = Shard{
            huge1: 1,
            huge2: 2,
            huge3: 3,
            huge4: 4,
            huge5: 5,
            huge6: 6,
            huge7: 7,
            huge8: 8,
            huge9: 9,
            huge10: 10,
            huge11: 11,
            huge12: 12,
            huge13: 13,
            huge14: 14,
            huge15: 15,
            huge16: 16
        };
    }
}

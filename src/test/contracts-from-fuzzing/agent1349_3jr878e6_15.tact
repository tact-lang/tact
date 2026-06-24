struct MultiSerial {
    a: Int as int64;
    b: Int as uint64;
    c: Int as int128;
    d: Int as uint128;
    e: Int as uint256;
}

contract VariousSerial {
    data: MultiSerial = MultiSerial{
        a:1,b:2,c:3,d:4,e:5
    };

    receive() {
        self.data = self.data;
    }
}
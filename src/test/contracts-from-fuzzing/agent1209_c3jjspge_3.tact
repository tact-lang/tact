struct EdgeInts {
    huge: Int;             
    small: Int as uint4;  
    signed64: Int as int64;
    maxbits: Int as int257;
}

contract IntsTest {
    data: EdgeInts;

    init() {
        self.data = EdgeInts{
            huge: 0,
            small: 0,
            signed64: 0,
            maxbits: 0,
        };
    }
}

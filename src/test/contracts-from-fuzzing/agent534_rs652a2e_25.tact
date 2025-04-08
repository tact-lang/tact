struct SerializedInts {
    a: Int as uint3;
    b: Int as int5;
    c: Int as uint6;
}

contract SerializedIntsTest {
    data: SerializedInts;

    init() {
        self.data = SerializedInts{
            a:7,b:-7,c:63
        };
    }
}
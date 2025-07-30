struct SerializationTest {
    small: Int as uint4;
    big: Int as int257;
    mid: Int as int128;
    flag: Bool;
}

contract ContractWithSerialization {
    data: SerializationTest;

    init() {
        self.data = SerializationTest{
            small:5, big:42, mid:100, flag:true
        };
    }
}
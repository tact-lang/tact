struct WithSerialization {
    bigVal: Int as int257;
    smallVal: Int as uint4;
    mediumVal: Int as uint64;
}

contract SerializationFieldsTest {
    info: WithSerialization;

    init() {
        self.info = WithSerialization{
            bigVal: 100,
            smallVal: 3,
            mediumVal: 2020,
        };
    }
}
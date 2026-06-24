struct SerStruct {
    foo: Int as uint8;
    bar: Int as int16;
}

contract SerializationAnnotationTest {
    data: SerStruct;

    init() {
        self.data = SerStruct{
            foo: 10,
            bar: -300,
        };
    }
}
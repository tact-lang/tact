struct NestedWithSerialization {
    a: Int as uint8;
    b: Int as int16;
}

struct ContainerSerial {
    inner: NestedWithSerialization;
}

contract ContainerSerialContract {
    data: ContainerSerial;

    init() {
        self.data = ContainerSerial{ inner: NestedWithSerialization{ a:1, b:2 } };
    }
}

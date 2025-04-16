// Combine serialization and optionals in nested struct
struct DeepSerialOpt {
    a: Int? as uint8;
    b: Int as int64;
    c: Bool?;
}

contract SerialOptContract {
    data: DeepSerialOpt;

    init() {
        self.data = DeepSerialOpt{
            a: null,
            b: 123456,
            c: true
        };
    }
}

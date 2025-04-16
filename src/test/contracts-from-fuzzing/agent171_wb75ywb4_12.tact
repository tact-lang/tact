struct Serializable {
    int1: Int as uint4;
    int2: Int as int8;
    int3: Int as coins;
    text: String;
}

contract SerializableTest {
    field: Serializable;
    init() {
        self.field = Serializable{ int1:1, int2:-4, int3:10, text:"x" };
    }
}
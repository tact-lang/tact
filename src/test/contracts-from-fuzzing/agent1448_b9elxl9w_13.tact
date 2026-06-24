struct MsgData {
    field1: Int;
    field2: Bool?;
    field3: String;
}

contract StructStorage {
    data: MsgData;

    init() {
        self.data = MsgData{ field1:42, field2:null, field3:"hey" };
    }
}
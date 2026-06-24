struct SubStruct {
    s: String;
    flag: Bool;
}

contract StructStorage {
    val: SubStruct;

    init() {
        self.val = SubStruct{ s: "ok", flag: true };
    }
}
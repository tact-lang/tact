struct TinyHuge {
    tiny: Int as int1;
    huge: Int as int257;
}

contract StructSerializeEdge {
    val: TinyHuge;

    init() {
        self.val = TinyHuge{ tiny: 1, huge: 123456789 };
    }
}
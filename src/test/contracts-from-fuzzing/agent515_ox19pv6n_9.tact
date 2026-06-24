message(202) InnerMsg {
    x: Int = 42;
    y: String?;
}

struct OuterStruct {
    z: Int = 1;
    nested: InnerMsg = InnerMsg{};
}

contract Test {
    data: OuterStruct = OuterStruct{
        z: 77,
        nested: InnerMsg{x: 999}
    };

    receive() {
        let _ = self.data.nested.x;
    }
}
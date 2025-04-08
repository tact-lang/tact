struct WrapOpt {
    x: Int?;
    y: Bool?;
}

contract StructWithOptsStorage {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{};
    }

    receive() {
        let _ = self.data;
    }
}
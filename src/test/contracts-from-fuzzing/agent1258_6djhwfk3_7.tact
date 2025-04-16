struct OptionalSlice {
    desc: String;
    content: Slice?;
}

contract OptionalSliceTest {
    packet: OptionalSlice;

    init() {
        self.packet = OptionalSlice{
            desc: "empty",
            content: null,
        };
    }

    receive() {
        if (self.packet.content == null) {
            self.packet = OptionalSlice{
                desc: "filled",
                content: emptyCell().asSlice(),
            };
        }
    }
}
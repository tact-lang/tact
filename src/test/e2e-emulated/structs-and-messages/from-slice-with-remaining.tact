message Msg {
    value: Int;
    data: Slice as remaining;
}

contract Test {
    receive() {}

    get fun name(): Msg {
        let data = Msg {
            value: 1,
            data: beginCell()
                .storeUint(1, 32)
                .endCell()
                .asSlice(),
        }.toSlice();

        return Msg.fromSlice(data);
    }
}

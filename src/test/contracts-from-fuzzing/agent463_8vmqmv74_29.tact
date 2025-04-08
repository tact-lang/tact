struct RemainHolder {
    prefix: Int as uint8;
    suffix: Slice as remaining;
}

contract RemainCont {
    data: RemainHolder;

    init() {
        self.data = RemainHolder{
            prefix: 2,
            suffix: "hi".asComment().asSlice()
        };
    }
}
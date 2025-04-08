struct StrSer {
    strFull: String;
    strAsSlice: Slice as remaining;
}

contract StrSerTest {
    data: StrSer;

    init() {
        self.data = StrSer{
            strFull: "hello",
            strAsSlice: "world".asComment().asSlice()
        };
    }
}
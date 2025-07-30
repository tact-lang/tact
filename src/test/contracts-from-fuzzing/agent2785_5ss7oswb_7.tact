struct WideStruct {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
    a7: Int;
    a8: Int;
    a9: Int;
    a10: Int;
}

contract Test(
    w: WideStruct,
) {
    receive() {
        let _ = self.w.a1 + self.w.a10;
    }
}

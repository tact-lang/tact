struct ComposeOptional {
    addr: Address?;
    coin: Int?;
    txt: String?;
    cel: Cell?;
}

contract OptComposeTest {
    val: ComposeOptional;
    init() {
        self.val = ComposeOptional{
            addr: null,
            coin: null,
            txt: null,
            cel: null
        };
    }
}

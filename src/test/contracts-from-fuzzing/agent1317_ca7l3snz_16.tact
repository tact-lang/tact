struct ComposeStr {
    text: String;
}
struct ComposeAddr {
    addr: Address;
}

contract ComposeContract {
    strf: ComposeStr;
    addrf: ComposeAddr;
    num: Int;

    init() {
        self.strf = ComposeStr{ text: "abc" };
        self.addrf = ComposeAddr{ addr: myAddress() };
        self.num = 1;
    }
}
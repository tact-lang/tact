struct Info {
    addr: Address?;
}

contract Test {
    info: Info;

    init() {
        let addr: Address = myAddress();
        self.info = Info{ addr };
    }
}
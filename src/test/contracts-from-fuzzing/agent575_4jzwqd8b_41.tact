message Info { data: Int }

contract Test {
    msgData: Info;

    init() {
        self.msgData = Info{ data: 5 };
    }
}

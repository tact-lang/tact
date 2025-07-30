struct MessageStruct {
    alpha: Int;
}

message Beta {
    bravo: Int;
    charlie: Bool;
}

struct ContainsMessages {
    mfield: MessageStruct;
    mbeta: Beta;
}

contract TestContract {
    data: ContainsMessages;

    init() {
        self.data = ContainsMessages{
            mfield: MessageStruct{alpha: 5},
            mbeta: Beta{bravo: 1, charlie:true}
        };
    }
}
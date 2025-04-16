message(1) MyMsg {}

struct EmptyHolder {
    msg: MyMsg;
}

contract ContractWithEmptyMsgHolder {
    data: EmptyHolder;

    init() {
        self.data = EmptyHolder{
            msg: MyMsg{}
        };
    }
}

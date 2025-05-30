message(0xAA) MyMsg {
    a: Int;
}

contract TestMapMessage {
    m: map<Int, MyMsg> = emptyMap();

    receive() {
        let msg: MyMsg = MyMsg { a: 777 };
        self.m.set(1, msg);
        let retrieved = self.m.get(1)!!;
        let aVal = retrieved.a;
        self.reply(aVal.toString().asComment());
    }
}

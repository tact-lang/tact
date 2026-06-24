message MyMsg {
    a: Int;
}

contract Test {
    flag: Int = 0;

    // Typed binary message receiver using a valid message declaration
    receive(msg: MyMsg) {
        self.flag = msg.a;
    }

    get fun trigger(): Int {
         return self.flag;
    }
}

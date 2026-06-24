message MyMsg {
    a: Int;
}

contract TestUnderscore {
    flag: Int = 0;

    // Receiver with underscore discards the parameter
    receive(_: MyMsg) {
        self.flag = 7;
    }

    get fun trigger(): Int {
        return self.flag;
    }
}

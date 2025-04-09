message UnderscoreMsg {
    val: Int;
}

contract TestUnderscore {
    flag: Bool = false;

    // Receiver using underscore to discard the parameter
    receive(_: UnderscoreMsg) {
         self.flag = true;
    }
}

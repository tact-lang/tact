message(123) MyMsg {
    num: Int;
    flag: Bool;
}

contract TestContract {
    m: MyMsg?;

    init() {
        self.m = null;
    }
}
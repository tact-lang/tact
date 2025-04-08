message(123) MyMessage {
    q: Int;
    flag: Bool;
}

contract TestContract {
    m: MyMessage;

    init() {
        self.m = MyMessage{
            q: 7,
            flag: true
        };
    }
}
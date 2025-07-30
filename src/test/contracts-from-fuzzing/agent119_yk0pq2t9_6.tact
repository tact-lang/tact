struct Info {
    count: Int;
    active: Bool;
}

contract TestContract {
    data: Info;
    flag: Bool = false;
    counter: Int = 0;
    text: String = "hello";

    init() {
        self.data = Info{ count: 77, active: true };
        self.flag = true;
        self.counter = 5;
        self.text = "world";
    }
}
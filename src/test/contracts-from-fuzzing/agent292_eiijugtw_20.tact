struct Container {
    num: Int;
    text: String;
    flag: Bool;
}

contract BasicCombo {
    state: Container;

    init() {
        self.state = Container{num:1, text:"hello", flag:true};
    }
}
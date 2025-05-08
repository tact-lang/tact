message(999) MessageVal {
    num: Int;
    text: String;
}

contract TestContract {
    msgval: MessageVal = MessageVal{ num: 10, text: "hi" };
    init() {}
}
struct Data {
    number: Int;
    flag: Bool;
    text: String;
}

contract AssignInInit {
    info: Data;

    init() {
        let d = Data{ number: 5, flag: true, text: "hi" };
        self.info = d;
    }
}

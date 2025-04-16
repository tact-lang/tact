// Message with nested struct containing String, as contract storage
struct Hello {
    msg: String;
    flag: Bool;
}

message(55) Hi {
    h: Hello;
    x: Int;
}

contract TestContract {
    val: Hi;

    init() {
        self.val = Hi{
            h: Hello { msg: "x", flag: true },
            x: 5,
        };
    }
}
struct Edgey {
    a: Int;
    b: Bool;
    c: String;
}

contract EdgeTest {
    storage: Edgey;
    init() {
        self.storage = Edgey{
            a: 0,
            b: false,
            c: ""
        };
    }
}
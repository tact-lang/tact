struct Mix {
    a: Int = 1;
    b: Int;
    c: Bool = false;
    d: Bool;
    name: String;
    desc: String = "";
}

contract PartInit {
    data: Mix;
    init() {
        self.data = Mix{
            b: 2,
            d: true,
            name: "hello"
        };
    }
    receive() {}
}
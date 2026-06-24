struct Info {
    a: Int?;
    b: Bool?;
}

contract ComboContract {
    x: Int;
    y: Bool;
    info: Info;

    init() {
        self.x = 100;
        self.y = true;
        self.info = Info{
            a: null,
            b: false
        };
    }
}
struct Sub {
    flag: Bool = false;
}

struct Main {
    sub: Sub;
    txt: String;
}

contract DefaultNested {
    data: Main;

    init() {
        self.data = Main{
            sub: Sub{},
            txt: "hello"
        };
    }
}
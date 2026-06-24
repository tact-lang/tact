struct Sub {
    x: Int?;
}

struct Main {
    a: Sub;
    b: Sub;
}

contract Test {
    data: Main;

    init() {
        self.data = Main{a: Sub{x:null}, b: Sub{x:null}};
    }
}
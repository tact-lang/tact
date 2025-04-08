struct Mix {
    a: Int = 10;
    b: Int = 20;
}

contract Test {
    m: Mix;

    init() {
        self.m = Mix{ a:1, b:2 };
    }
}
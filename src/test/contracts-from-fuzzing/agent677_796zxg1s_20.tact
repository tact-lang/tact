struct Mix {
    a: Int = 10;
    b: Int = 20;
}

contract Test {
    m: Mix;

    init() {
        self.m = Mix{ b:42 };
    }
}
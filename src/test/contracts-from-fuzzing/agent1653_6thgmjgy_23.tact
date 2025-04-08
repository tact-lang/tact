struct Sub {
    val: Int = 777;
    optStr: String?;
}

struct Container {
    sub: Sub?;
    num: Int = 1;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            sub: null,
            num: 5
        };
    }
}
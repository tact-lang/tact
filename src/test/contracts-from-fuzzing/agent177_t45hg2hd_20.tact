struct X {
    a: Int = 1;
    b: Bool?;
}

struct Y {
    x: X?;
    s: String?;
}

contract TwoOptionalsNested {
    data: Y? = null;

    init() {
        self.data = null;
    }
    receive(){}
}
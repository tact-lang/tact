struct Compose1 {
    a: Int;
}

struct Compose2 {
    b: Int;
    ins: Compose1;
}

contract ComposeContract {
    data: Compose2;

    init() {
        self.data = Compose2{
            b: 77,
            ins: Compose1{
                a: 55
            }
        };
    }
}
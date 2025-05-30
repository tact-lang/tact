struct PartialDefault {
    a: Int;
    b: Int = 7;
    c: Int;
}

contract PartialDefaultContract {
    data: PartialDefault;

    init() {
        self.data = PartialDefault{
            a:1,
            c:3
        };
    }
}
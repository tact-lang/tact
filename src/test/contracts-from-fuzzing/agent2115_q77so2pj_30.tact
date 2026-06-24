// optional field of struct type without default, explicit assign in init
struct Inner {
    flag: Bool;
}

contract NullInit {
    data: Inner?;
    init() {
        self.data = Inner{ flag: true };
    }
}
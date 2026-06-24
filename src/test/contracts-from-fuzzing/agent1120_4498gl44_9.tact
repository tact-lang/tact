struct Nested {
    val: Int;
    s: Sub;
}

struct Sub {
    flag: Bool;
}

contract WrongOrder {
    test: Nested;
    init() {
        self.test = Nested{val:5, s:Sub{flag:true}};
    }
}
struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    point: Nested;
    flag: Bool = true;
    counter: Int = 10;
    
    init() {
        self.counter = 42;
        self.flag = false;
        self.point = Nested{
            a: 5,
            b: true,
        };
    }
}

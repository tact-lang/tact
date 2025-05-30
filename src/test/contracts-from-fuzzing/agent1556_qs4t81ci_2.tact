struct Nested {
    level2: Int = 2;
}

struct Outer {
    level1: Nested = Nested{};
}

contract TestContract {
    main: Outer = Outer{};

    init() {
        self.main = Outer{level1: Nested{level2: 99}};
    }
    
    receive() {
        let _ = self.main.level1.level2;
    }
}
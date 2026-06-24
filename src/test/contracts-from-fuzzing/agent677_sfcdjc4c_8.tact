struct SubOpt1 {
    a: Int?;
    b: String?;
}

struct SubOpt2 {
    x: Bool?;
    y: Int?;
}

struct MainContainer {
    so1: SubOpt1?;
    so2: SubOpt2?;
}

contract OptionalNestedStructs {
    val: MainContainer;

    init() {
        self.val = MainContainer{
            so1: SubOpt1{ a: null, b: null },
            so2: SubOpt2{ x: null, y: null },
        };
    }

    receive() {
        let _ = self.val.so1;
    }
}
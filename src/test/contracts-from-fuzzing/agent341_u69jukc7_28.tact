struct BigNest {
    val1: Int;
    val2: Nested1;
    val3: Nested2;
}

struct Nested1 {
    a: Bool;
    b: Bool?;
}

struct Nested2 {
    x: Int;
    y: String?;
}

contract TestContract {
    obj: BigNest;

    init() {
        self.obj = BigNest{
            val1: 1,
            val2: Nested1{ a:true, b:null },
            val3: Nested2{ x:7, y:null }
        };
    }
}
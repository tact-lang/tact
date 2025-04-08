struct DeepOptional {
    a: Int?;
    s: Sub?;
}

struct Sub {
    b: Int?;
    s2: Sub2?;
}

struct Sub2 {
    c: Int?;
}

contract DeepOptTest {
    val: DeepOptional;
    init() {
        self.val = DeepOptional{ a:null, s:null };
    }
}
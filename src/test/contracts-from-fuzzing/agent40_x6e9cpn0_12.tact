struct C1 { x: Int }

struct C2 {
    a: C1?;
    b: Int?;
}

contract OptionalNested {
    val: C2;
    init() {
        self.val = C2{
            a: null,
            b: null
        };
    }
}
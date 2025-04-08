struct T1 { x: Int }
struct T2 { y: Int }
struct T3 {
    a: T1?;
    b: T2?;
}

contract OptionalOfNestedStructs {
    field: T3;

    init() {
        self.field = T3 {
            a: null,
            b: null
        };
    }
}

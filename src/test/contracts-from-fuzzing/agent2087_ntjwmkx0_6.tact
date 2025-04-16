struct Recursion1 {
    val: Int;
    nested: Recursion2?;
}

struct Recursion2 {
    val: Bool;
}

contract NullableMidRecursion {
    field: Recursion1;

    init() {
        self.field = Recursion1{
            val: 1,
            nested: Recursion2{val:true}
        };
    }
}
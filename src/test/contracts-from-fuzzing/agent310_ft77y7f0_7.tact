struct NestedLevel3 {
    val: Int;
}

struct NestedLevel2 {
    val: NestedLevel3;
    opt: NestedLevel3?;
}

struct NestedLevel1 {
    val: NestedLevel2;
    opt: NestedLevel2?;
}

contract TestContract {
    nest: NestedLevel1;

    init() {
        self.nest = NestedLevel1{
            val: NestedLevel2{
                val: NestedLevel3{val: 10},
                opt: null
            },
            opt: null
        };
    }
}

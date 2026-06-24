struct DeeplyNestedOptionalDefault {
    nested: Nest1?;
}

struct Nest1 {
    nested: Nest2?;
}

struct Nest2 {
    nested: Nest3?;
}

struct Nest3 {
    val: Int? = null;
}

contract TestContract {
    x: DeeplyNestedOptionalDefault;

    init() {
        self.x = DeeplyNestedOptionalDefault{
            nested: Nest1{
                nested: Nest2{
                    nested: Nest3{
                        val: null
                    }
                }
            }
        };
    }
}
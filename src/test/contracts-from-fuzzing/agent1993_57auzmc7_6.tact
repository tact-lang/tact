struct DeeplyNestedLevel3 {
    val3: Int;
}

struct DeeplyNestedLevel2 {
    val2: DeeplyNestedLevel3;
}

struct DeeplyNestedLevel1 {
    val1: DeeplyNestedLevel2;
}

contract TestContract {
    dn: DeeplyNestedLevel1;

    init() {
        self.dn = DeeplyNestedLevel1{
            val1: DeeplyNestedLevel2{
                val2: DeeplyNestedLevel3{ val3: 7 }
            }
        };
    }
}
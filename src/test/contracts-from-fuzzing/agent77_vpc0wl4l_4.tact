struct SLevel3 {
    deep: Int;
}

struct SLevel2 {
    nestedDeep: SLevel3;
    val: Bool?;
}

struct SLevel1 {
    intVal: Int;
    nestedMid: SLevel2;
}

contract DeeplyNested {
    data: SLevel1;

    init() {
        self.data = SLevel1{
            intVal: 7,
            nestedMid: SLevel2{
                nestedDeep: SLevel3{deep: 3},
                val: null
            }
        };
    }

    receive() {
        self.data = SLevel1{
            intVal: 8,
            nestedMid: SLevel2{
                nestedDeep: SLevel3{deep: 4},
                val: true
            }
        };
    }
}

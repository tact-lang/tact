struct DeeplyNested {
    lv1: Int;
    lv2: Nested2;
}

struct Nested2 {
    lv3: Nested3;
}

struct Nested3 {
    lv4: Nested4;
}

struct Nested4 {
    lv5: Nested5;
}

struct Nested5 {
    leaf: Int;
}

contract TestContract {
    data: DeeplyNested;
    init() {
        self.data = DeeplyNested{
            lv1:1,
            lv2: Nested2{
                lv3: Nested3{
                    lv4: Nested4{
                        lv5: Nested5{ leaf:42 }
                    }
                }
            }
        };
    }
}

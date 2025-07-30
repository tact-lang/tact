struct VeryNestedLevel4 {
    n: Int;
    flag: Bool;
}

struct VeryNestedLevel3 {
    deeper: VeryNestedLevel4;
    txt: String;
}

struct VeryNestedLevel2 {
    deeper: VeryNestedLevel3;
    number: Int;
}

struct VeryNestedLevel1 {
    deeper: VeryNestedLevel2;
}

contract UltraDeepTest {
    value: VeryNestedLevel1;

    init() {
        self.value = VeryNestedLevel1{
            deeper: VeryNestedLevel2{
                deeper: VeryNestedLevel3{
                    deeper: VeryNestedLevel4{ n: 42, flag: true },
                    txt: "deep"
                },
                number: 99
            }
        };
    }
}
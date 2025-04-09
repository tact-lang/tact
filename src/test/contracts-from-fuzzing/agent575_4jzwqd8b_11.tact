struct NestedLevel4 {
    data: Int;
}

struct NestedLevel3 {
    l4: NestedLevel4;
    flag3: Bool;
}

struct NestedLevel2 {
    l3: NestedLevel3;
    flag2: Bool;
}

struct NestedLevel1 {
    l2: NestedLevel2;
    flag1: Bool;
}

contract TestContract {
    deep: NestedLevel1;

    init() {
        self.deep = NestedLevel1{
            l2: NestedLevel2{
                l3: NestedLevel3{
                    l4: NestedLevel4{ data:42 },
                    flag3:true
                },
                flag2:false
            },
            flag1:true
        };
    }
}

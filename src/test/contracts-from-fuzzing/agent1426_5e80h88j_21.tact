struct LargeNested {
    p1: Nested1;
    p2: Nested1;
    p3: Nested1;
}

struct Nested1 {
    x: Int;
    y: Nested2;
}

struct Nested2 {
    flag: Bool;
    label: String;
}

contract LargeNestedContract {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            p1: Nested1{ x:1, y: Nested2{ flag:true, label:"a" } },
            p2: Nested1{ x:2, y: Nested2{ flag:false, label:"b" } },
            p3: Nested1{ x:3, y: Nested2{ flag:true, label:"c" } }
        };
    }
}
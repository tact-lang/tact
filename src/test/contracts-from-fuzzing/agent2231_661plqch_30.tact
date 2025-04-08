struct Flattened {
    a: Int;
    b: NestedOne;
    c: NestedTwo;
}

struct NestedOne {
    val: Int;
    flag: Bool;
}

struct NestedTwo {
    x: Int;
    y: Bool;
}

contract FlattenedContract {
    data: Flattened;

    init() {
        self.data = Flattened{
            a:1,
            b:NestedOne{val:2, flag:true},
            c:NestedTwo{x:3, y:false}
        };
    }
}
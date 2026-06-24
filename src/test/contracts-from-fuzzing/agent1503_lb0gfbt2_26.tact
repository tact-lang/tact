struct ArrLike {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

struct Wrap {
    one: ArrLike;
    two: ArrLike;
    three: ArrLike;
}

contract FlatManyStructs {
    val: Wrap;
    init() {
        self.val = Wrap{
            one: ArrLike{a:1,b:2,c:3,d:4},
            two: ArrLike{a:5,b:6,c:7,d:8},
            three: ArrLike{a:9,b:10,c:11,d:12}
        };
    }
    receive() {}
}
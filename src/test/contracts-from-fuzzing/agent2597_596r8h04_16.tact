struct InnerList {
    one: Int;
    two: Bool;
}

struct Nested1 {
    inner1: InnerList;
    inner2: InnerList;
}

struct Nested2 {
    lvl1: Nested1;
    lvl2: Nested1;
}

contract Combine {
    rec: Nested2;

    init() {
        self.rec = Nested2{
            lvl1: Nested1{inner1: InnerList{one: 1, two: true}, inner2: InnerList{one: 2, two: false}},
            lvl2: Nested1{inner1: InnerList{one: 3, two: true}, inner2: InnerList{one: 4, two: false}},
        };
    }
}
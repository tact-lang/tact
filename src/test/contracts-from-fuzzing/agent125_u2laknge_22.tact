// optional structs nested with explicit serialization inside
struct SS1 {
    small: Int as uint3;
    flag: Bool;
}

struct SS2 {
    inner: SS1?;
    n: Int;
}

contract OptionalSer {
    data: SS2;

    init() {
        self.data = SS2{
            inner: SS1{ small:7, flag:true },
            n: 50,
        };
    }
}
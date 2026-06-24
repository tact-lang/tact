struct Combine1 { x: Int }
struct Combine2 { y: Bool }
struct Combine3 { z: String }

struct ComboAll {
    a: Combine1;
    b: Combine2;
    c: Combine3;
    d: Int;
    e: Bool;
    f: String;
}

contract ComboTest {
    field: ComboAll;
    init() {
        self.field = ComboAll{
            a: Combine1{x:1},
            b: Combine2{y:true},
            c: Combine3{z:"ok"},
            d: 2, e: false, f: "hello"
        };
    }
}
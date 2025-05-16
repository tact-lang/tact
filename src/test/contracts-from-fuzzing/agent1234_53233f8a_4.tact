struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }
struct Inner3 { c: String; }

struct OuterStruct {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
    val: Int?;
    flag: Bool?;
}

contract WideNested {
    stored: OuterStruct;

    init() {
        self.stored = OuterStruct{
            i1: Inner1{a: 5},
            i2: Inner2{b: true},
            i3: Inner3{c: "yo"},
            val: null,
            flag: null
        };
    }
}
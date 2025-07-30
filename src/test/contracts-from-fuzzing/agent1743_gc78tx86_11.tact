struct Inner1 { a: Int; b: Int; }
struct Inner2 { c: Int; d: Int; }
struct BigStruct {
    s1: Inner1;
    s2: Inner2;
    e: Int;
}

contract StructOfStructs {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            s1: Inner1{ a:1, b:2 },
            s2: Inner2{ c:3, d:4 },
            e: 5
        };
    }
}
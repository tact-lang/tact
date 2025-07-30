struct LongNested {
    n: Nested;
}
struct Nested {
    d: Deep;
}
struct Deep {
    dd: Deeper;
}
struct Deeper {
    ddd: Deepest;
}
struct Deepest {
    val: Int;
}
contract TestContract {
    complex: LongNested;
    init() {
        self.complex = LongNested{
            n: Nested{
                d: Deep{
                    dd: Deeper{
                        ddd: Deepest{ val: 7 }
                    }
                }
            }
        };
    }
}
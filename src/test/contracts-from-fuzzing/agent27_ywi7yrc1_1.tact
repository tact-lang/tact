struct InnerNested {
 x: Int;
 y: Int;
}

struct OuterNested {
 nested: InnerNested;
 val: Int;
}

contract TestDeepNested {
 field: OuterNested;

 init() {
 self.field = OuterNested{
 nested: InnerNested{
 x: 1,
 y: 2,
 },
 val: 3,
 };
 }
}
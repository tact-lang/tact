struct NestedInnerA {
    x: Int;
    y: Bool;
}
struct NestedInnerB {
    z: String;
    flag: Bool;
}

struct ComposedStruct {
    innerA: NestedInnerA;
    innerB: NestedInnerB;
    val: Int;
}

contract StructWithMultipleNestingsTest {
    val: ComposedStruct;

    init() {
        self.val = ComposedStruct{
            innerA: NestedInnerA{x:1,y:true},
            innerB: NestedInnerB{z:"zz",flag:false},
            val: 42
        };
    }
}
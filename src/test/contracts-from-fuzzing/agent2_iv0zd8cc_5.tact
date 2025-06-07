struct InnerStruct {
    a: Int;
    b: Int;
}

struct OuterStruct {
    inner: InnerStruct;
    x: Int;
    y: Int;
}

contract TestNestedStruct {
    receive() {
         let innerVal: InnerStruct = InnerStruct{ a: 42, b: 84 };
         let outerVal: OuterStruct = OuterStruct{ inner: innerVal, x: 10, y: 20 };
         dump(outerVal.inner.a);
    }
}

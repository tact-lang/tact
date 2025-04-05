struct Inner {
    FieldA: Int;
    FieldB: Int;
}

struct Outer {
    OuterField: Inner;
    Field2: Int;
}

fun useNested(o: Outer): Int {
    return o.OuterField.FieldA + o.Field2;
}

contract TestContract {
    receive() {
        let innerVal = Inner { FieldA: 10, FieldB: 20 };
        let outerVal = Outer { OuterField: innerVal, Field2: 5 };
        useNested(outerVal);
    }
}

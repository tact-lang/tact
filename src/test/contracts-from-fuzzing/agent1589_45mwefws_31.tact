struct SimpleStruct { a: Int }

contract UseConstantDefault {
    s: SimpleStruct = SimpleStruct{ a: 42 };
}
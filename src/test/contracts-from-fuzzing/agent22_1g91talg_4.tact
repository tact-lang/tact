fun testBlock() : Int {
    // Testing a block without trailing semicolon after the closing brace
    {
        let a = 1;
        let b = 2;
    }
    return 1 + 2;
}

fun testOptional() : Int? {
    // Testing explicit declaration for an optional value with null initialization
    let opt: Int? = null;
    return opt;
}

struct MyStruct {
    a: Int;
    b: Int;
}

fun testStruct() : MyStruct {
    // Testing struct literal with trailing commas allowed
    return MyStruct{
        a: 10,
        b: 20, // trailing comma is allowed
    };
}

fun main() {
    testBlock();
    testOptional();
    testStruct();
}

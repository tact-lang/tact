primitive Int;
primitive Bool;
primitive Cell;

trait BaseTrait {
    
}

struct SomeStruct {
    a: Int;
    b: Int;
}

fun main() {
    let a: SomeStruct = SomeStruct{
        a: 1,
        b: false // Invalid type
    };
}

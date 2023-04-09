primitive Int;
primitive Bool;
primitive Cell;

trait BaseTrait {
    
}

struct SomeStruct {
    a: Int;
    b: Int;
    c: Int;
}

fun main() {
    let a: SomeStruct = SomeStruct{
        a: 1,
        b: 3
    };
}

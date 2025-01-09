primitive Int;

trait BaseTrait {
    
}

fun test() {
    let a: map<Int, Int as uint32> = emptyMap();
    let b = a;
}
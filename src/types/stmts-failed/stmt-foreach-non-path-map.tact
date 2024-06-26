primitive Int;

trait BaseTrait {
    
}

fun mapFun(): map<Int, Int> {
    return emptyMap();
}

fun foo(x: Int) {
    foreach (k, v in mapFun()) {
        throw(1042);
    }
    return;
}
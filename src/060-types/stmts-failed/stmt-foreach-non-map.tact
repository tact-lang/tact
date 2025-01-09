primitive Int;

trait BaseTrait {
    
}

fun foo(x: Int) {
    foreach (k, v in x) {
        throw(1042);
    }
    return;
}
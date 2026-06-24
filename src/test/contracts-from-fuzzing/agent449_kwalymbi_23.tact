struct Innermost {
    val: Int;
}

struct Container {
    inner: Innermost?;
}

contract TestContract {
    data: Container? = null;
}
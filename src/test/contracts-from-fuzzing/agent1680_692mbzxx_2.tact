struct Inner {
    val1: Int = 1;
    optVal: Bool?;   // Defaults to null implicitly
}

struct Outer {
    inner: Inner;   // No default, will init via contract
    flag: Bool = true;
}

contract TestStructNest {
    data: Outer = Outer{
        inner: Inner{
            val1: 10
        },
        flag: false
    };

    receive() {}
}
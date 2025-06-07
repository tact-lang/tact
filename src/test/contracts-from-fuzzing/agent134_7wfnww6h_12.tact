struct SDemo {
    val: Int = 123;
}

struct Wrap {
    inner: SDemo? = null;
}

contract DeepDefaulted {
    top: Wrap = Wrap{ inner: null };
}
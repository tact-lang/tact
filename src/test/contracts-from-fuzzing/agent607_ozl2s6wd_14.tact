struct Inner { n: Int? = null }
struct Outer { i: Inner? = null }

contract DeepOptDefaults {
    data: Outer? = null;
}
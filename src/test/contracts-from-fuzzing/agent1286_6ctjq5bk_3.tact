struct Deep1 { val1: Int; }
struct Deep2 { inner: Deep1; val2: Int; }
struct Deep3 { inner: Deep2; val3: Int; }
struct Deep4 { inner: Deep3; val4: Int; }

contract DeepNest {
    d: Deep4;

    init() {
        self.d = Deep4{
            inner: Deep3{
                inner: Deep2{
                    inner: Deep1{ val1: 1 },
                    val2: 2,
                },
                val3: 3,
            },
            val4: 4,
        };
    }
}
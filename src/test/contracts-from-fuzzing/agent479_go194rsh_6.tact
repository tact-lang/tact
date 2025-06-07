struct Deep1 { val1: Int; }
struct Deep2 { s: Deep1; val2: Int; }
struct Deep3 { s: Deep2; val3: Int; }
struct Deep4 { s: Deep3; val4: Int; }
struct Deep5 { s: Deep4; val5: Int; }

contract DeepNest {
    data: Deep5;

    init() {
        self.data = Deep5{
            s: Deep4{
                s: Deep3{
                    s: Deep2{
                        s: Deep1{ val1: 1 },
                        val2: 2,
                    },
                    val3: 3,
                },
                val4: 4,
            },
            val5: 5,
        };
    }
}
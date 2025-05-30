struct Deep1 { next: Deep2; val1: Int; }
struct Deep2 { next: Deep3; val2: Int; }
struct Deep3 { next: Deep4; val3: Int; }
struct Deep4 { next: Deep5; val4: Int; }
struct Deep5 { val5: Int; }

contract TestContract {
    d: Deep1;

    init() {
        self.d = Deep1{
            next: Deep2{
                next: Deep3{
                    next: Deep4{
                        next: Deep5{
                            val5: 55,
                        },
                        val4: 44,
                    },
                    val3: 33,
                },
                val2: 22,
            },
            val1: 11,
        };
    }
}

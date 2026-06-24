struct S {
    val1: Int;
    val2: Int?;
    val3: Bool;
    val4: String;
    val5: Bool?;
}

struct SLevel2 {
    s1: S?;
    s2: S;
}

contract TestOptionals {
    data: SLevel2;

    init() {
        self.data = SLevel2{
            s1: null,
            s2: S{
                val1: 5,
                val2: null,
                val3: true,
                val4: "fuzz",
                val5: null
            }
        };
    }
}
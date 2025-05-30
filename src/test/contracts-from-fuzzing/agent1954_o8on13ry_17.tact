struct VeryDeep {
    next: VeryDeep2?;
    val: Int;
}

struct VeryDeep2 {
    next: VeryDeep3?;
    val: Int;
}

struct VeryDeep3 {
    val: Int;
}

contract DeepOptionals {
    data: VeryDeep;
    init() {
        self.data = VeryDeep{
            next: VeryDeep2{
                next: null,
                val: 2,
            },
            val: 1,
        };
    }
}
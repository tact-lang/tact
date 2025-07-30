struct Alpha {
    val: Int;
    opt: Beta?;
}

struct Beta {
    val: Int;
    opt: Gamma?;
}

struct Gamma {
    val: Int?;
}

contract TestContract {
    data: Alpha = Alpha{
        val: 5,
        opt: Beta{
            val: 4,
            opt: Gamma{ val: null }
        }
    };
}

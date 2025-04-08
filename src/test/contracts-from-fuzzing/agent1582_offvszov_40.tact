struct SOpt {
    val: Int?;
}

struct Wrap {
    sopt: SOpt;
}

contract NullWrappedOptional {
    w: Wrap = Wrap {
        sopt: SOpt{
            val: null
        }
    };

    receive() {}
}
struct Deep {
    val: Int?;
}

struct Mid {
    deep: Deep?;
}

contract TestContract {
    field: Mid = Mid{
        deep: Deep{ val: null }
    };
}

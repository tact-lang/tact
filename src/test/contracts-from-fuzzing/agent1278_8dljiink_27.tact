struct Bottom {
    val: Int?;
}

struct Mid {
    inner: Bottom?;
}

struct Top {
    mid: Mid?;
}

contract TestContract {
    data: Top?;

    init() {
        self.data = null;
    }
}
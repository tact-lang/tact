struct DeeplyOptional {
    x: Int?;
    y: String?;
}

struct Wrapper {
    field: DeeplyOptional?;
}

contract OptInOpt {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            field: null,
        };
    }
}
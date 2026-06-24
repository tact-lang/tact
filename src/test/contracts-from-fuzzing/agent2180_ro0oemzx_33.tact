struct Sample {
    s: String? = null;
}

contract MultipleAssigns {
    field: Sample;

    init() {
        self.field = Sample{};
        self.field = Sample{ s:"hello" };
    }
}
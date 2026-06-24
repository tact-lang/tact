struct InnerMost {
    z: Int?;
}

struct Deep {
    middle: InnerMost?;
}

struct All {
    level: Deep?;
    note: String = "deep optionals";
}

contract TestContract {
    complexOpt: All?;

    init() {
        self.complexOpt = null;
    }
}
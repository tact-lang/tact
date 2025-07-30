struct OptionalDeep {
    inn: Inner?;
}

struct Inner {
    sub: SubInner;
}

struct SubInner {
    val: Int;
}

contract TestContract {
    od: OptionalDeep;

    init() {
        self.od = OptionalDeep{inn:null};
    }
}
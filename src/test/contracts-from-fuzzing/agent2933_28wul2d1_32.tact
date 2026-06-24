struct Wrapper1 {
    val: Int?;
}

struct Wrapper2 {
    nested: Wrapper1?;
}

struct Wrapper3 {
    nested2: Wrapper2?;
}

contract ManyOptionWraps {
    data: Wrapper3;

    init() {
        self.data = Wrapper3{ nested2: null };
    }
}
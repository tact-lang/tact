struct InnerOptional {
    val: Int?;
}

struct OuterOpt {
    o: InnerOptional?;
}

contract TestContract {
    myField: OuterOpt;

    init() {
        self.myField = OuterOpt{ o: InnerOptional{ val: 42 } };
    }
}
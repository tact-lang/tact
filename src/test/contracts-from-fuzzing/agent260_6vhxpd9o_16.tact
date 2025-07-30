struct InnerManyOpt {
    a: Int? as uint8;
    b: Int? as uint16;
}

struct OuterManyOpt {
    inner: InnerManyOpt;
}

contract ManyOptionalsSer {
    data: OuterManyOpt;

    init() {
        self.data = OuterManyOpt{ inner: InnerManyOpt{ a: null, b: null } };
    }
}
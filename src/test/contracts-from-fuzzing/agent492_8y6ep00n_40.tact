struct Inner {
    a: Int?;
}

struct Contains {
    field: Inner;
}

contract Test {
    bigField: Contains?;

    init() {
        self.bigField = Contains{field: Inner{a:null}};
    }
}
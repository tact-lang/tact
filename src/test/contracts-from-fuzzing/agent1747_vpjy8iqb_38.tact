struct Base {
    id: Int;
}

struct Wrap {
    inner: Base;
}

contract InitWithConstruct {
    data: Wrap;
    
    init() {
        let tmp = Base{ id: 55 };
        self.data = Wrap{ inner: tmp };
    }
}
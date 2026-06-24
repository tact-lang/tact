struct WithManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ManyOptionals {
    data: WithManyOptional;

    init() {
        self.data = WithManyOptional { a:null, b:null, c:null };
    }
}

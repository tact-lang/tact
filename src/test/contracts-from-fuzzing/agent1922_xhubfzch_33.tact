struct HasOptional {
    foo: Int?;
}

contract AssignNothing {
    val: HasOptional;

    init() {
        self.val = HasOptional{
            foo: null
        };
    }
}
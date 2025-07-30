struct HasDefaultOpt {
    a: Int;
    b: String? = null;
    c: Bool = false;
}

contract DefaultStruct {
    data: HasDefaultOpt;

    init() {
        self.data = HasDefaultOpt{
            a: 123
        };
    }
}

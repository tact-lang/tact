struct DefaultOptional{
    a: Int?;
    b: Bool?;
}

contract TestContract {
    x: DefaultOptional;

    init() {
        self.x = DefaultOptional{
            a:null,
            b:true
        };
    }
}
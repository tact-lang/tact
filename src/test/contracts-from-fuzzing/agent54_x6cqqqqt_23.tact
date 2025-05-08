struct DefaultOverride {
    a: Int = 5;
    b: Int?;
}

contract TestContract {
    data: DefaultOverride;

    init() {
        self.data = DefaultOverride{
            a:12,b:null
        };
    }
}
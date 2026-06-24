struct BigOptional {
    nested: Inner?;
}
struct Inner {
    val1: Int;
    val2: Bool;
    val3: String?;
}

contract BigOptContract {
    state: BigOptional;

    init() {
        self.state = BigOptional{
            nested: Inner{
                val1:123,
                val2:true,
                val3:null
            }
        };
    }
}

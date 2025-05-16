struct DefaultOptMixed {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract DefaultOptMixedTest {
    x: DefaultOptMixed;

    init() {
        self.x = DefaultOptMixed{
            a:null,b:true,c:null
        };
    }
}
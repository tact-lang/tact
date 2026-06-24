struct InnerS { val: Int; }
struct OuterS { data: InnerS?; }

contract DeepOptionalTest {
    custom: OuterS?;

    init() {
        self.custom = OuterS{
            data: InnerS{ val: 42 }
        };
    }
}

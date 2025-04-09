struct Embed1 {
    one: Int;
}

struct Embed2 {
    two: Embed1;
}

struct Embed3 {
    three: Embed2;
}

contract DeepInheritanceLike {
    x: Embed3;

    init() {
        self.x = Embed3{
            three: Embed2{
                two: Embed1{
                    one: 99
                }
            }
        };
    }
}

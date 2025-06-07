struct Inner {
    val: Int?;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract PartialStructDefault {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{} 
            }
        };
    }
}
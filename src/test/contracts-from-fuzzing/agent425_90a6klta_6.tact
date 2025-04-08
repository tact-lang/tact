struct Inner {
    x: Int as uint8;
    y: Bool;
}

struct Outer {
    val: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            val: Inner{ x:255, y:true }
        };
    }
}
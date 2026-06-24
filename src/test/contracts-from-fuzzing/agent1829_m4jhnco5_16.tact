struct Inner { x: Int = 1; }
struct Outer {
    s: String = "str";
    o: Int?; // defaults to null
    n: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            n: Inner{}
        };
    }
}
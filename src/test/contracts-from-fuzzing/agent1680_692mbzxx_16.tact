struct Inner { val: Int = 1; }
struct Mid { inner: Inner?; }
struct Outer { mid: Mid?; }

contract DoubleOptStruct {
    data: Outer = Outer{};
    receive() {}
}
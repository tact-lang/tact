struct D2 { x: Int = 5; }
struct D1 { d2: D2 }

contract ParamWithDeepDefault(
    foo: Int,
    bar: D1
) {
    receive() {
        let _ = 1;
    }
}